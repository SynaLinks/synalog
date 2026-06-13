//! Stratification check for Logica programs.
//!
//! A program is stratified if there are no negative recursion cycles.
//! Uses Tarjan's SCC algorithm to detect cycles, then checks if any
//! SCC contains a negative dependency edge.
//!
//! Mirrors the Lean 4 specification.

use std::collections::{HashMap, HashSet};
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

/// Tarjan's SCC algorithm state.
struct TarjanState {
    index: usize,
    stack: Vec<String>,
    on_stack: HashSet<String>,
    indices: HashMap<String, usize>,
    lowlinks: HashMap<String, usize>,
    sccs: Vec<Vec<String>>,
}

impl TarjanState {
    fn new() -> Self {
        TarjanState {
            index: 0,
            stack: Vec::new(),
            on_stack: HashSet::new(),
            indices: HashMap::new(),
            lowlinks: HashMap::new(),
            sccs: Vec::new(),
        }
    }
}

/// Find strongly connected components using Tarjan's algorithm.
fn tarjan(graph: &HashMap<String, Vec<(String, bool)>>) -> Vec<Vec<String>> {
    let mut state = TarjanState::new();

    let nodes: Vec<String> = graph.keys().cloned().collect();
    for v in &nodes {
        if !state.indices.contains_key(v) {
            strong_connect(graph, v, &mut state);
        }
    }

    state.sccs
}

fn strong_connect(
    graph: &HashMap<String, Vec<(String, bool)>>,
    v: &str,
    state: &mut TarjanState,
) {
    // Set index and lowlink
    state.indices.insert(v.to_string(), state.index);
    state.lowlinks.insert(v.to_string(), state.index);
    state.index += 1;
    state.stack.push(v.to_string());
    state.on_stack.insert(v.to_string());

    // Visit successors
    if let Some(successors) = graph.get(v) {
        for (w, _negated) in successors {
            if !state.indices.contains_key(w) {
                // w not visited
                strong_connect(graph, w, state);
                let v_low = state.lowlinks[v];
                let w_low = state.lowlinks[w];
                state.lowlinks.insert(v.to_string(), v_low.min(w_low));
            } else if state.on_stack.contains(w) {
                // w is on stack = part of current SCC
                let v_low = state.lowlinks[v];
                let w_idx = state.indices[w];
                state.lowlinks.insert(v.to_string(), v_low.min(w_idx));
            }
        }
    }

    // If v is root, pop SCC
    if state.lowlinks[v] == state.indices[v] {
        let mut scc = Vec::new();
        loop {
            let w = state.stack.pop().unwrap();
            state.on_stack.remove(&w);
            scc.push(w.clone());
            if w == v {
                break;
            }
        }
        state.sccs.push(scc);
    }
}

/// Check if an SCC contains a negative internal edge.
fn scc_has_negative_edge(scc: &[String], edges: &[DepEdge]) -> bool {
    let scc_set: HashSet<&str> = scc.iter().map(|s| s.as_str()).collect();

    edges.iter().any(|e| {
        e.negated && scc_set.contains(e.from.as_str()) && scc_set.contains(e.to.as_str())
    })
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

/// Find strongly connected components (public interface for other modules).
pub fn find_sccs(graph: &HashMap<String, Vec<(String, bool)>>) -> Vec<Vec<String>> {
    tarjan(graph)
}

/// Check if a program is stratified.
pub fn check_stratification(rules: &[&Json]) -> Result<(), StratificationError> {
    // Extract all dependency edges
    let edges: Vec<DepEdge> = rules.iter().flat_map(|r| extract_deps(r)).collect();

    if edges.is_empty() {
        return Ok(());
    }

    // Build graph and find SCCs
    let graph = build_graph(&edges);
    let sccs = tarjan(&graph);

    // Check each SCC for negative edges
    for scc in &sccs {
        if scc.len() > 1 || graph.get(&scc[0]).map_or(false, |adj| adj.iter().any(|(to, _)| to == &scc[0])) {
            // This is a non-trivial SCC (has cycle)
            if scc_has_negative_edge(scc, &edges) {
                return Err(StratificationError {
                    cycle: scc.clone(),
                });
            }
        }
    }

    Ok(())
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
}
