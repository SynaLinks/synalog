// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Stratification check for Synalog programs.
//!
//! A program is stratified if there are no negative recursion cycles: no
//! negative dependency `P -> Q` with `Q` reaching back to `P`. The graph
//! algorithms are `synalog_verified`'s, proved correct with Verus.

use std::collections::{BTreeMap, HashMap};
use crate::parser::Json;
use crate::errors::VerifyError;

/// Stratification error (legacy type).
///
/// For new code, prefer using `crate::errors::VerifyError::NegativeCycle`.
#[derive(Debug, Clone)]
pub struct StratificationError {
    /// Predicates involved in the negative cycle.
    pub cycle: Vec<String>,
}

impl std::fmt::Display for StratificationError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "Negative recursion cycle detected: {}", self.cycle.join(" -> "))
    }
}

impl std::error::Error for StratificationError {}

impl From<StratificationError> for VerifyError {
    fn from(e: StratificationError) -> Self {
        VerifyError::NegativeCycle { predicates: e.cycle }
    }
}

impl From<StratificationError> for crate::errors::SynalogError {
    fn from(e: StratificationError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// Dependency edge: (from, to, is_negated).
#[derive(Debug, Clone)]
struct DepEdge {
    from: String,
    to: String,
    negated: bool,
}

/// Extract dependency edges from a rule.
fn extract_deps(rule: &Json) -> Vec<DepEdge> {
    let head_pred = rule.as_object()["head"].as_object()["predicate_name"].as_str().to_string();

    let Some(body) = rule.as_object().get("body") else {
        return vec![];
    };

    let mut edges = Vec::new();
    collect_deps_from_conjunction(body, &head_pred, &mut edges);
    edges
}

fn collect_deps_from_conjunction(body: &Json, head_pred: &str, edges: &mut Vec<DepEdge>) {
    let Some(conj) = body.as_object().get("conjunction") else {
        return;
    };
    let Some(conjuncts) = conj.as_object().get("conjunct") else {
        return;
    };

    for c in conjuncts.as_array() {
        collect_deps_from_conjunct(c, head_pred, edges);
    }
}

fn collect_deps_from_conjunct(conjunct: &Json, head_pred: &str, edges: &mut Vec<DepEdge>) {
    let obj = conjunct.as_object();

    // Positive predicate
    if let Some(pred) = obj.get("predicate") {
        let pred_name = pred.as_object()["predicate_name"].as_str();

        // Check if this is IsNull wrapping a combine (negation)
        if pred_name == "IsNull" {
            if let Some(record) = pred.as_object().get("record") {
                if let Some(fv_arr) = record.as_object().get("field_value") {
                    for fv in fv_arr.as_array() {
                        if let Some(expr) = fv.as_object().get("value")
                            .and_then(|v| v.as_object().get("expression"))
                        {
                            if let Some(combine) = expr.as_object().get("combine") {
                                // This is negation - the actual negated predicates are in the body
                                if let Some(inner_body) = combine.as_object().get("body") {
                                    collect_deps_from_conjunction_negated(inner_body, head_pred, edges);
                                }
                            }
                        }
                    }
                }
            }
        } else {
            // Regular positive predicate
            edges.push(DepEdge {
                from: head_pred.to_string(),
                to: pred_name.to_string(),
                negated: false,
            });
        }
        return;
    }

    // Disjunction
    if let Some(disj) = obj.get("disjunction") {
        if let Some(branches) = disj.as_object().get("disjunct") {
            for branch in branches.as_array() {
                collect_deps_from_conjunction(branch, head_pred, edges);
            }
        }
    }
}

fn collect_deps_from_conjunction_negated(body: &Json, head_pred: &str, edges: &mut Vec<DepEdge>) {
    let Some(conj) = body.as_object().get("conjunction") else {
        return;
    };
    let Some(conjuncts) = conj.as_object().get("conjunct") else {
        return;
    };

    for c in conjuncts.as_array() {
        collect_conjunct_deps_negated(c, head_pred, edges);
    }
}

fn collect_conjunct_deps_negated(conjunct: &Json, head_pred: &str, edges: &mut Vec<DepEdge>) {
    let obj = conjunct.as_object();

    // Predicate call inside negation
    if let Some(pred) = obj.get("predicate") {
        let pred_name = pred.as_object()["predicate_name"].as_str();
        edges.push(DepEdge {
            from: head_pred.to_string(),
            to: pred_name.to_string(),
            negated: true,
        });
        return;
    }

    // Disjunction inside negation - recurse into branches
    if let Some(disj) = obj.get("disjunction") {
        if let Some(branches) = disj.as_object().get("disjunct") {
            for branch in branches.as_array() {
                collect_deps_from_conjunction_negated(branch, head_pred, edges);
            }
        }
    }
}

/// The graph over the nodes `0..n`, the predicates sorted by name: the
/// names, the node of each name, and the successors of each node.
fn index_graph(graph: &HashMap<String, Vec<(String, bool)>>) -> (Vec<&str>, HashMap<&str, usize>, Vec<Vec<usize>>) {
    let mut names: Vec<&str> = graph.keys().map(|s| s.as_str()).collect();
    names.sort_unstable();
    let index: HashMap<&str, usize> = names.iter().enumerate().map(|(i, name)| (*name, i)).collect();
    let successors = names.iter().map(|name| graph[*name].iter().map(|(to, _)| index[to.as_str()]).collect()).collect();
    (names, index, successors)
}

/// Build adjacency list from edges.
fn build_graph(edges: &[DepEdge]) -> HashMap<String, Vec<(String, bool)>> {
    let mut graph: HashMap<String, Vec<(String, bool)>> = HashMap::new();

    for e in edges {
        graph.entry(e.from.clone()).or_default().push((e.to.clone(), e.negated));
        // Ensure 'to' node exists in graph even if it has no outgoing edges
        graph.entry(e.to.clone()).or_default();
    }

    graph
}

/// Build dependency graph from rules (public interface for other modules).
/// Returns adjacency list: predicate -> [(called_predicate, is_negated)]
pub fn build_dep_graph(rules: &[&Json]) -> HashMap<String, Vec<(String, bool)>> {
    let edges: Vec<DepEdge> = rules.iter().flat_map(|r| extract_deps(r)).collect();
    build_graph(&edges)
}

/// The recursive strongly connected components: those with two predicates
/// or more, or with a predicate that calls itself. Each lists its predicates
/// sorted, and the components come in the order of their first predicate.
/// The components, and which are recursive, are proved by `synalog_verified`.
pub fn recursive_sccs(graph: &HashMap<String, Vec<(String, bool)>>) -> Vec<Vec<String>> {
    let (names, _, successors) = index_graph(graph);
    let reach = synalog_verified::reachability(&successors);
    let component = synalog_verified::components(&successors, &reach);
    let on_cycle = synalog_verified::cycles(&successors, &reach);
    let mut sccs: BTreeMap<usize, Vec<String>> = BTreeMap::new();
    for (v, name) in names.iter().enumerate() {
        if on_cycle[v] {
            sccs.entry(component[v]).or_default().push(name.to_string());
        }
    }
    sccs.into_values().collect()
}

/// Check if a program is stratified: no recursion goes through a negation.
pub fn check_stratification(rules: &[&Json]) -> Result<(), StratificationError> {
    let edges: Vec<DepEdge> = rules.iter().flat_map(|r| extract_deps(r)).collect();
    let graph = build_graph(&edges);
    let (names, index, successors) = index_graph(&graph);
    let negative: Vec<(usize, usize)> = edges
        .iter()
        .filter(|e| e.negated)
        .map(|e| (index[e.from.as_str()], index[e.to.as_str()]))
        .collect();
    let reach = synalog_verified::reachability(&successors);
    let Some(i) = synalog_verified::first_negative_cycle(&successors, &reach, &negative) else {
        return Ok(());
    };
    // The cycle's predicates: the component of the negative edge.
    let component = synalog_verified::components(&successors, &reach);
    let of = component[negative[i].0];
    Err(StratificationError {
        cycle: names.iter().enumerate().filter(|(v, _)| component[*v] == of).map(|(_, name)| name.to_string()).collect(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    fn parse(code: &str) -> Json {
        parse_file(code, None, &[]).unwrap()
    }

    #[test]
    fn test_no_recursion_is_stratified() {
        let parsed = parse(r#"
            A(x) :- B(x);
            B(x) :- C(x);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        assert!(check_stratification(&rules).is_ok());
    }

    #[test]
    fn test_positive_recursion_is_stratified() {
        let parsed = parse(r#"
            Reachable(x, y) :- Edge(x, y);
            Reachable(x, z) :- Reachable(x, y), Edge(y, z);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        assert!(check_stratification(&rules).is_ok());
    }

    #[test]
    fn test_negative_cycle_names_its_predicates() {
        let parsed = parse(r#"
            A(x) :- B(x), ~C(x);
            B(x) :- A(x);
            C(x) :- A(x);
            D(x) :- C(x);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let err = check_stratification(&rules).unwrap_err();
        assert_eq!(err.cycle, vec!["A", "B", "C"]);
    }

    /// The signed dependency edges `(from, to, negated)` over the predicates
    /// `0..n`, and `n` — the shape `synalog_verified::strata` works on.
    fn signed_edges(rules: &[&Json]) -> (Vec<(usize, usize, bool)>, usize) {
        let deps: Vec<DepEdge> = rules.iter().flat_map(|r| extract_deps(r)).collect();
        let graph = build_graph(&deps);
        let (_, index, _) = index_graph(&graph);
        let edges = deps
            .iter()
            .map(|e| (index[e.from.as_str()], index[e.to.as_str()], e.negated))
            .collect();
        (edges, index.len())
    }

    #[test]
    fn test_stratified_program_has_a_stratum_numbering() {
        // Negation, but no negative cycle: a valid stratum numbering exists,
        // and the Verus-proved `strata` must produce one (validated by the
        // proved `check_strata`).
        let parsed = parse(r#"
            A(x) :- B(x), ~C(x);
            B(x) :- D(x);
            C(x) :- D(x);
            D(x) :- E(x);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        assert!(check_stratification(&rules).is_ok());
        let (edges, n) = signed_edges(&rules);
        let numbering = synalog_verified::strata::strata(&edges, n);
        assert!(numbering.is_some(), "a stratified program must admit a stratum numbering");
        assert!(synalog_verified::strata::check_strata(&edges, &numbering.unwrap()));
    }

    #[test]
    fn test_negative_cycle_has_no_stratum_numbering() {
        // A negation inside a recursion: no valid numbering, so `strata`
        // returns None (and the verifier rejects the program).
        let parsed = parse(r#"
            A(x) :- B(x), ~C(x);
            B(x) :- A(x);
            C(x) :- A(x);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        assert!(check_stratification(&rules).is_err());
        let (edges, n) = signed_edges(&rules);
        assert!(synalog_verified::strata::strata(&edges, n).is_none());
    }

    #[test]
    fn test_recursive_sccs() {
        let parsed = parse(r#"
            A(x) :- B(x);
            B(x) :- A(x);
            C(x) :- C(x), A(x);
            D(x) :- A(x);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let sccs = recursive_sccs(&build_dep_graph(&rules));
        assert_eq!(sccs, vec![vec!["A", "B"], vec!["C"]]);
    }
}
