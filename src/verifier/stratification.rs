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

/// Extract dependency edges from a rule: every predicate its body and head
/// read, wherever they read it (a conjunct, or a `combine` subquery in any
/// expression, nested at any depth), negated when a negation encloses it.
fn extract_deps(rule: &Json) -> Vec<DepEdge> {
    let head = rule.as_object()["head"].as_object();
    let head_pred = head["predicate_name"].as_str().to_string();

    let mut edges = Vec::new();
    if let Some(body) = rule.as_object().get("body") {
        collect_deps_from_conjunction(body, &head_pred, false, &mut edges);
    }
    if let Some(record) = head.get("record") {
        collect_deps_from_expr(record, &head_pred, false, &mut edges);
    }
    edges
}

fn collect_deps_from_conjunction(body: &Json, head_pred: &str, negated: bool, edges: &mut Vec<DepEdge>) {
    let Some(conj) = body.as_object().get("conjunction") else {
        return;
    };
    let Some(conjuncts) = conj.as_object().get("conjunct") else {
        return;
    };

    for c in conjuncts.as_array() {
        collect_deps_from_conjunct(c, head_pred, negated, edges);
    }
}

fn collect_deps_from_conjunct(conjunct: &Json, head_pred: &str, negated: bool, edges: &mut Vec<DepEdge>) {
    let obj = conjunct.as_object();

    if let Some(pred) = obj.get("predicate") {
        let pred_name = pred.as_object()["predicate_name"].as_str();
        // A negation `~P(...)` is `IsNull(combine ...)`: its argument's
        // predicates are read negated.
        if pred_name == "IsNull" {
            if let Some(record) = pred.as_object().get("record") {
                collect_deps_from_expr(record, head_pred, true, edges);
            }
        } else {
            edges.push(DepEdge {
                from: head_pred.to_string(),
                to: pred_name.to_string(),
                negated,
            });
            if let Some(record) = pred.as_object().get("record") {
                collect_deps_from_expr(record, head_pred, negated, edges);
            }
        }
        return;
    }

    if let Some(disj) = obj.get("disjunction") {
        if let Some(branches) = disj.as_object().get("disjunct") {
            for branch in branches.as_array() {
                collect_deps_from_conjunction(branch, head_pred, negated, edges);
            }
        }
        return;
    }

    // A unification, an inclusion, ...: the subqueries in its expressions.
    collect_deps_from_expr(conjunct, head_pred, negated, edges);
}

/// The predicates the `combine` subqueries of an expression read.
fn collect_deps_from_expr(expr: &Json, head_pred: &str, negated: bool, edges: &mut Vec<DepEdge>) {
    match expr {
        Json::Object(obj) => {
            if let Some(combine) = obj.get("combine") {
                for (key, value) in combine.as_object().iter() {
                    if key == "body" {
                        collect_deps_from_conjunction(value, head_pred, negated, edges);
                    } else {
                        collect_deps_from_expr(value, head_pred, negated, edges);
                    }
                }
                return;
            }
            // `IsNull(combine ...)` in an expression is a negation too.
            let negates = obj
                .get("call")
                .is_some_and(|call| call.as_object().get("predicate_name").is_some_and(|n| n.is_string() && n.as_str() == "IsNull"));
            for (_, value) in obj.iter() {
                collect_deps_from_expr(value, head_pred, negated || negates, edges);
            }
        }
        Json::Array(items) => items.iter().for_each(|item| collect_deps_from_expr(item, head_pred, negated, edges)),
        _ => {}
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
    fn test_negation_in_a_nested_subquery_is_a_negative_cycle() {
        let parsed = parse(r#"
            @Recursive(P, 4);
            P(x: 1);
            P(x: 2) :- n == (combine += 1 :- ~P(x: 2)), n is not null;
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let err = check_stratification(&rules).unwrap_err();
        assert_eq!(err.cycle, vec!["P"]);
    }

    #[test]
    fn test_negation_in_a_head_subquery_is_a_negative_cycle() {
        let parsed = parse(r#"
            A(x: 1);
            A(x:, y: (combine += 1 :- ~A(x: 2))) :- B(x:);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        assert!(check_stratification(&rules).is_err());
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
