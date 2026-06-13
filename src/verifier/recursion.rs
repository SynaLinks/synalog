//! Recursion safety checks for Synalog rules.
//!
//! Detects problematic recursion patterns:
//! - Recursion without a base case
//! - Trivial self-loops (predicate calls itself with same arguments)

use std::collections::{HashMap, HashSet};
use crate::parser::Json;
use crate::errors::VerifyError;

/// Recursion error.
#[derive(Debug, Clone)]
pub enum RecursionError {
    /// Recursive predicate has no base case.
    NoBaseCase {
        predicate: String,
        rule: String,
    },
    /// Trivial self-loop: predicate calls itself with identical arguments.
    TrivialLoop {
        predicate: String,
        rule: String,
    },
    /// Recursive predicate missing @Recursive annotation.
    UnboundedRecursion {
        predicate: String,
        rule: String,
    },
}

impl std::fmt::Display for RecursionError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            RecursionError::NoBaseCase { predicate, .. } => {
                write!(f, "Recursive predicate '{}' has no base case", predicate)
            }
            RecursionError::TrivialLoop { predicate, .. } => {
                write!(f, "Trivial infinite loop: '{}' calls itself with same arguments", predicate)
            }
            RecursionError::UnboundedRecursion { predicate, .. } => {
                write!(f, "Recursive predicate '{}' missing @Recursive annotation", predicate)
            }
        }
    }
}

impl std::error::Error for RecursionError {}

impl From<RecursionError> for VerifyError {
    fn from(e: RecursionError) -> Self {
        match e {
            RecursionError::NoBaseCase { predicate, rule } => {
                VerifyError::NoBaseCase { predicate, rule }
            }
            RecursionError::TrivialLoop { predicate, rule } => {
                VerifyError::TrivialLoop { predicate, rule }
            }
            RecursionError::UnboundedRecursion { predicate, rule } => {
                VerifyError::UnboundedRecursion { predicate, rule }
            }
        }
    }
}

impl From<RecursionError> for crate::errors::SynalogError {
    fn from(e: RecursionError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// Get the predicate name from a rule's head.
fn head_predicate(rule: &Json) -> &str {
    rule.as_object()["head"].as_object()["predicate_name"].as_str()
}

/// Get rule text for error messages.
fn rule_text(rule: &Json) -> String {
    rule.as_object()
        .get("full_text")
        .map(|j| j.as_str().to_string())
        .unwrap_or_else(|| "<unknown>".to_string())
}

/// Check if a rule is a fact (no body).
fn is_fact(rule: &Json) -> bool {
    !rule.as_object().contains_key("body")
}

/// Get predicates called in the body of a rule.
fn body_predicates(rule: &Json) -> HashSet<String> {
    let mut preds = HashSet::new();
    if let Some(body) = rule.as_object().get("body") {
        collect_body_predicates(body, &mut preds);
    }
    preds
}

fn collect_body_predicates(body: &Json, preds: &mut HashSet<String>) {
    let obj = body.as_object();
    if let Some(conj) = obj.get("conjunction") {
        if let Some(conjuncts) = conj.as_object().get("conjunct") {
            for c in conjuncts.as_array() {
                collect_conjunct_predicates(c, preds);
            }
        }
    }
}

fn collect_conjunct_predicates(conjunct: &Json, preds: &mut HashSet<String>) {
    let obj = conjunct.as_object();

    if let Some(pred) = obj.get("predicate") {
        let name = pred.as_object()["predicate_name"].as_str();
        preds.insert(name.to_string());
        return;
    }

    if let Some(disj) = obj.get("disjunction") {
        if let Some(branches) = disj.as_object().get("disjunct") {
            for branch in branches.as_array() {
                collect_body_predicates(branch, preds);
            }
        }
    }

    // Check for predicates in combine (subquery)
    if let Some(unif) = obj.get("unification") {
        if let Some(rhs) = unif.as_object().get("right_hand_side") {
            collect_expr_predicates(rhs, preds);
        }
    }
}

fn collect_expr_predicates(expr: &Json, preds: &mut HashSet<String>) {
    let obj = expr.as_object();

    if let Some(call) = obj.get("call") {
        let name = call.as_object()["predicate_name"].as_str();
        preds.insert(name.to_string());
    }

    if let Some(combine) = obj.get("combine") {
        if let Some(body) = combine.as_object().get("body") {
            collect_body_predicates(body, preds);
        }
    }
}

/// Check for recursive predicates without base cases (handles mutual recursion).
pub fn check_base_cases(rules: &[&Json]) -> Vec<RecursionError> {
    use super::stratification::{build_dep_graph, find_sccs};

    let mut errors = Vec::new();

    // Group rules by predicate
    let mut rules_by_pred: HashMap<String, Vec<&Json>> = HashMap::new();
    for rule in rules {
        let pred = head_predicate(rule).to_string();
        if !pred.starts_with('@') {
            rules_by_pred.entry(pred).or_default().push(rule);
        }
    }

    // Build dependency graph and find SCCs for mutual recursion detection
    let graph = build_dep_graph(rules);
    let sccs = find_sccs(&graph);

    // Check each SCC for base cases
    for scc in sccs {
        let is_recursive_scc = scc.len() > 1 ||
            graph.get(&scc[0]).map_or(false, |adj| adj.iter().any(|(to, _)| to == &scc[0]));

        if !is_recursive_scc {
            continue;
        }

        // For mutual recursion, we need at least one predicate in the SCC to have a base case
        // that doesn't depend on any other predicate in the SCC
        let scc_set: HashSet<&str> = scc.iter().map(|s| s.as_str()).collect();

        for pred in &scc {
            let Some(pred_rules) = rules_by_pred.get(pred) else {
                continue;
            };

            // A base case is a rule that doesn't call any predicate in the SCC
            let has_base_case = pred_rules.iter().any(|r| {
                if is_fact(r) {
                    return true;
                }
                let called = body_predicates(r);
                !called.iter().any(|p| scc_set.contains(p.as_str()))
            });

            if !has_base_case {
                let first_rule = pred_rules.first().unwrap();
                errors.push(RecursionError::NoBaseCase {
                    predicate: pred.clone(),
                    rule: rule_text(first_rule),
                });
            }
        }
    }

    errors
}

/// Check for trivial self-loops: P(x) :- P(x) with same arguments.
pub fn check_trivial_loops(rules: &[&Json]) -> Vec<RecursionError> {
    let mut errors = Vec::new();

    for rule in rules {
        let head_pred = head_predicate(rule);
        if head_pred.starts_with('@') || is_fact(rule) {
            continue;
        }

        // Get head argument representations for comparison
        let head_args = get_head_arg_reprs(rule);
        if head_args.is_empty() {
            continue;
        }

        // Check body for same predicate with same arguments
        if let Some(body) = rule.as_object().get("body") {
            if has_identical_self_call(body, head_pred, &head_args) {
                errors.push(RecursionError::TrivialLoop {
                    predicate: head_pred.to_string(),
                    rule: rule_text(rule),
                });
            }
        }
    }

    errors
}

/// Representation of an argument for comparison.
#[derive(Debug, Clone, PartialEq)]
enum ArgRepr {
    /// A variable with its name.
    Var(String),
    /// A literal or complex expression (serialized for comparison).
    Expr(String),
}

/// Get argument representations from head for comparison.
fn get_head_arg_reprs(rule: &Json) -> Vec<ArgRepr> {
    let head = &rule.as_object()["head"];
    let mut args = Vec::new();

    if let Some(record) = head.as_object().get("record") {
        if let Some(fv_arr) = record.as_object().get("field_value") {
            for fv in fv_arr.as_array() {
                if let Some(expr) = fv.as_object().get("value")
                    .and_then(|v| v.as_object().get("expression"))
                {
                    args.push(expr_to_repr(expr));
                }
            }
        }
    }

    args
}

/// Convert an expression to a comparable representation.
fn expr_to_repr(expr: &Json) -> ArgRepr {
    let obj = expr.as_object();

    // Variable
    if let Some(var_obj) = obj.get("variable") {
        return ArgRepr::Var(var_obj.as_object()["var_name"].as_str().to_string());
    }

    // For literals and other expressions, serialize to string for comparison
    // This ensures P(1, 2) vs P(1, 3) are correctly distinguished
    ArgRepr::Expr(format!("{:?}", expr))
}

/// Check if body has a call to predicate with identical arguments.
fn has_identical_self_call(body: &Json, pred_name: &str, head_args: &[ArgRepr]) -> bool {
    let obj = body.as_object();
    if let Some(conj) = obj.get("conjunction") {
        if let Some(conjuncts) = conj.as_object().get("conjunct") {
            for c in conjuncts.as_array() {
                if check_conjunct_for_identical_call(c, pred_name, head_args) {
                    return true;
                }
            }
        }
    }
    false
}

fn check_conjunct_for_identical_call(conjunct: &Json, pred_name: &str, head_args: &[ArgRepr]) -> bool {
    let obj = conjunct.as_object();

    if let Some(pred) = obj.get("predicate") {
        let name = pred.as_object()["predicate_name"].as_str();
        if name == pred_name {
            let call_args = get_call_arg_reprs(pred);
            if call_args == head_args {
                return true;
            }
        }
    }

    if let Some(disj) = obj.get("disjunction") {
        if let Some(branches) = disj.as_object().get("disjunct") {
            for branch in branches.as_array() {
                if has_identical_self_call(branch, pred_name, head_args) {
                    return true;
                }
            }
        }
    }

    false
}

/// Get argument representations from a predicate call for comparison.
fn get_call_arg_reprs(pred: &Json) -> Vec<ArgRepr> {
    let mut args = Vec::new();

    if let Some(record) = pred.as_object().get("record") {
        if let Some(fv_arr) = record.as_object().get("field_value") {
            for fv in fv_arr.as_array() {
                if let Some(expr) = fv.as_object().get("value")
                    .and_then(|v| v.as_object().get("expression"))
                {
                    args.push(expr_to_repr(expr));
                }
            }
        }
    }

    args
}

/// Collect predicates that have @Recursive annotations.
fn collect_recursive_annotations(all_rules: &[&Json]) -> HashSet<String> {
    let mut annotated = HashSet::new();

    for rule in all_rules {
        let head_pred = head_predicate(rule);
        if head_pred == "@Recursive" {
            // @Recursive(PredicateName, limit) - extract the predicate name
            if let Some(record) = rule.as_object()["head"].as_object().get("record") {
                if let Some(fv_arr) = record.as_object().get("field_value") {
                    let fields = fv_arr.as_array();
                    if !fields.is_empty() {
                        // First argument is the predicate name
                        if let Some(expr) = fields[0].as_object().get("value")
                            .and_then(|v| v.as_object().get("expression"))
                        {
                            // Could be:
                            // - literal with the_predicate (most common)
                            // - variable (predicate name as var)
                            // - call
                            if let Some(literal) = expr.as_object().get("literal") {
                                if let Some(the_pred) = literal.as_object().get("the_predicate") {
                                    annotated.insert(
                                        the_pred.as_object()["predicate_name"].as_str().to_string()
                                    );
                                }
                            } else if let Some(var) = expr.as_object().get("variable") {
                                annotated.insert(var.as_object()["var_name"].as_str().to_string());
                            } else if let Some(call) = expr.as_object().get("call") {
                                annotated.insert(call.as_object()["predicate_name"].as_str().to_string());
                            }
                        }
                    }
                }
            }
        }
    }

    annotated
}

/// Find all recursive predicates (direct and mutual) using dependency graph SCCs.
fn find_recursive_predicates(rules: &[&Json]) -> HashMap<String, String> {
    use super::stratification::{build_dep_graph, find_sccs};

    let mut recursive = HashMap::new();

    // Build dependency graph and find SCCs
    let graph = build_dep_graph(rules);
    let sccs = find_sccs(&graph);

    // Collect first rule text for each predicate
    let mut rule_texts: HashMap<String, String> = HashMap::new();
    for rule in rules {
        let pred = head_predicate(rule);
        if !pred.starts_with('@') {
            rule_texts.entry(pred.to_string()).or_insert_with(|| rule_text(rule));
        }
    }

    // Any predicate in an SCC with >1 member, or with a self-loop, is recursive
    for scc in sccs {
        let is_recursive_scc = scc.len() > 1 ||
            graph.get(&scc[0]).map_or(false, |adj| adj.iter().any(|(to, _)| to == &scc[0]));

        if is_recursive_scc {
            for pred in scc {
                if let Some(rule_txt) = rule_texts.get(&pred) {
                    recursive.insert(pred, rule_txt.clone());
                }
            }
        }
    }

    recursive
}

/// Check for recursive predicates without @Recursive annotation.
pub fn check_unbounded_recursion(all_rules: &[&Json], normal_rules: &[&Json]) -> Vec<RecursionError> {
    let mut errors = Vec::new();

    let annotated = collect_recursive_annotations(all_rules);
    let recursive_preds = find_recursive_predicates(normal_rules);

    for (pred, rule) in recursive_preds {
        if !annotated.contains(&pred) {
            errors.push(RecursionError::UnboundedRecursion {
                predicate: pred,
                rule,
            });
        }
    }

    errors
}

/// Run all recursion checks (except unbounded, which needs all rules).
pub fn check_recursion(rules: &[&Json]) -> Vec<RecursionError> {
    let mut errors = Vec::new();
    errors.extend(check_base_cases(rules));
    errors.extend(check_trivial_loops(rules));
    errors
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    fn parse(code: &str) -> Json {
        parse_file(code, None, &[]).unwrap()
    }

    #[test]
    fn test_valid_recursion() {
        let parsed = parse(r#"
            Reachable(a, b) :- Edge(a, b);
            Reachable(a, c) :- Reachable(a, b), Edge(b, c);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_recursion(&rules);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_no_base_case() {
        let parsed = parse(r#"
            Loop(x) :- Loop(y), y == x - 1;
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_base_cases(&rules);
        assert_eq!(errors.len(), 1);
        assert!(matches!(&errors[0], RecursionError::NoBaseCase { predicate, .. } if predicate == "Loop"));
    }

    #[test]
    fn test_trivial_loop() {
        let parsed = parse(r#"
            Infinite(x) :- Infinite(x);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_trivial_loops(&rules);
        assert_eq!(errors.len(), 1);
        assert!(matches!(&errors[0], RecursionError::TrivialLoop { predicate, .. } if predicate == "Infinite"));
    }

    #[test]
    fn test_non_trivial_recursion_ok() {
        // This is valid - arguments change
        let parsed = parse(r#"
            Count(x) :- Count(y), y == x - 1;
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_trivial_loops(&rules);
        assert!(errors.is_empty()); // Not a trivial loop (different args)
    }

    #[test]
    fn test_unbounded_recursion_detected() {
        // Recursive predicate without @Recursive annotation
        let parsed = parse(r#"
            Reachable(a, b) :- Edge(a, b);
            Reachable(a, c) :- Reachable(a, b), Edge(b, c);
        "#);
        let all_rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let normal_rules: Vec<&Json> = all_rules.iter()
            .filter(|r| !r.as_object()["head"].as_object()["predicate_name"].as_str().starts_with('@'))
            .cloned()
            .collect();
        let errors = check_unbounded_recursion(&all_rules, &normal_rules);
        assert_eq!(errors.len(), 1);
        assert!(matches!(&errors[0], RecursionError::UnboundedRecursion { predicate, .. } if predicate == "Reachable"));
    }

    #[test]
    fn test_recursive_annotation_allows_recursion() {
        // Recursive predicate with @Recursive annotation - should be OK
        let parsed = parse(r#"
            @Recursive(Reachable, 10);
            Reachable(a, b) :- Edge(a, b);
            Reachable(a, c) :- Reachable(a, b), Edge(b, c);
        "#);
        let all_rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let normal_rules: Vec<&Json> = all_rules.iter()
            .filter(|r| !r.as_object()["head"].as_object()["predicate_name"].as_str().starts_with('@'))
            .cloned()
            .collect();
        let errors = check_unbounded_recursion(&all_rules, &normal_rules);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_transitive_closure_no_base_case() {
        // Transitive closure without base case
        let parsed = parse(r#"
            Reachable(a, c) :- Reachable(a, b), Reachable(b, c);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_base_cases(&rules);
        assert_eq!(errors.len(), 1);
        assert!(matches!(&errors[0], RecursionError::NoBaseCase { predicate, .. } if predicate == "Reachable"));
    }

    #[test]
    fn test_transitive_closure_with_base_case() {
        // Transitive closure with proper base case - valid
        let parsed = parse(r#"
            Reachable(a, b) :- Edge(a, b);
            Reachable(a, c) :- Reachable(a, b), Reachable(b, c);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_base_cases(&rules);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_transitive_not_trivial_loop() {
        // Transitive closure is NOT a trivial loop (different args in recursive calls)
        let parsed = parse(r#"
            Reachable(a, c) :- Reachable(a, b), Reachable(b, c);
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_trivial_loops(&rules);
        assert!(errors.is_empty()); // Not trivial - arguments differ
    }

    #[test]
    fn test_valid_transitive_closure() {
        // Complete valid transitive closure with @Recursive and base case
        let parsed = parse(r#"
            @Recursive(Reachable, 100);
            Reachable(a, b) :- Edge(a, b);
            Reachable(a, c) :- Reachable(a, b), Reachable(b, c);
        "#);
        let all_rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let normal_rules: Vec<&Json> = all_rules.iter()
            .filter(|r| !r.as_object()["head"].as_object()["predicate_name"].as_str().starts_with('@'))
            .cloned()
            .collect();

        // All checks should pass
        let base_errors = check_base_cases(&normal_rules);
        let loop_errors = check_trivial_loops(&normal_rules);
        let unbounded_errors = check_unbounded_recursion(&all_rules, &normal_rules);

        assert!(base_errors.is_empty(), "Expected no base case errors");
        assert!(loop_errors.is_empty(), "Expected no trivial loop errors");
        assert!(unbounded_errors.is_empty(), "Expected no unbounded recursion errors");
    }

    #[test]
    fn test_ancestor_pattern() {
        // Common ancestor/descendant pattern
        let parsed = parse(r#"
            @Recursive(Ancestor, 50);
            Ancestor(x, y) :- Parent(x, y);
            Ancestor(x, z) :- Ancestor(x, y), Parent(y, z);
        "#);
        let all_rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let normal_rules: Vec<&Json> = all_rules.iter()
            .filter(|r| !r.as_object()["head"].as_object()["predicate_name"].as_str().starts_with('@'))
            .cloned()
            .collect();

        let errors = check_recursion(&normal_rules);
        let unbounded = check_unbounded_recursion(&all_rules, &normal_rules);

        assert!(errors.is_empty());
        assert!(unbounded.is_empty());
    }

    #[test]
    fn test_mutual_recursion_no_base_case() {
        // A calls B, B calls A - mutual recursion without base cases
        let parsed = parse(r#"
            Even(x) :- Odd(y), x == y + 1;
            Odd(x) :- Even(y), x == y + 1;
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_base_cases(&rules);
        // Both Even and Odd should be flagged as missing base cases
        assert_eq!(errors.len(), 2);
        let preds: Vec<&str> = errors.iter()
            .filter_map(|e| match e {
                RecursionError::NoBaseCase { predicate, .. } => Some(predicate.as_str()),
                _ => None,
            })
            .collect();
        assert!(preds.contains(&"Even"));
        assert!(preds.contains(&"Odd"));
    }

    #[test]
    fn test_mutual_recursion_with_base_case() {
        // A calls B, B calls A - but with base cases
        let parsed = parse(r#"
            Even(x) :- x == 0;
            Even(x) :- Odd(y), x == y + 1;
            Odd(x) :- x == 1;
            Odd(x) :- Even(y), x == y + 1;
        "#);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_base_cases(&rules);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_mutual_recursion_unbounded() {
        // Mutual recursion needs @Recursive annotation for all predicates in SCC
        let parsed = parse(r#"
            @Recursive(Even, 10);
            @Recursive(Odd, 10);
            Even(x) :- x == 0;
            Even(x) :- Odd(y), x == y + 1;
            Odd(x) :- x == 1;
            Odd(x) :- Even(y), x == y + 1;
        "#);
        let all_rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let normal_rules: Vec<&Json> = all_rules.iter()
            .filter(|r| !r.as_object()["head"].as_object()["predicate_name"].as_str().starts_with('@'))
            .cloned()
            .collect();
        let errors = check_unbounded_recursion(&all_rules, &normal_rules);
        assert!(errors.is_empty());
    }
}
