// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Variable safety checks for Logica rules.
//!
//! Mirrors the Lean 4 specification:
//! - All head variables must appear in body (range restriction)
//! - Variables in negated predicates must appear positively
//! - Variables in aggregations must be bound outside the aggregate

use std::collections::HashSet;

use crate::parser::Json;
use crate::errors::VerifyError;
use super::vars::VarCollector;

/// Safety check error (legacy type).
///
/// For new code, prefer using `crate::errors::VerifyError`.
#[derive(Debug, Clone)]
pub enum SafetyError {
    /// Variable in head not bound in body.
    UnboundHeadVar {
        rule: String,
        var: String,
    },
    /// Variable compared in the body but bound by nothing.
    UnboundComparedVar {
        rule: String,
        var: String,
    },
    /// Variable only appears in negated context.
    UnsafeNegation {
        rule: String,
        var: String,
    },
    /// Variable in aggregation not bound outside.
    UnsafeAggregation {
        rule: String,
        var: String,
    },
    /// A function used as a condition: it holds whatever the function's value.
    FunctionAsCondition {
        rule: String,
        function: String,
    },
    DisjunctionInside {
        rule: String,
    },
    /// An aggregate called outside an aggregation.
    AggregateOutside {
        rule: String,
        function: String,
    },
}

impl std::fmt::Display for SafetyError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SafetyError::UnboundHeadVar { rule, var } => {
                write!(f, "Unbound variable '{}' in head of rule: {}", var, rule)
            }
            SafetyError::UnboundComparedVar { rule, var } => {
                write!(f, "Unbound variable '{}': it is tested (compared, negated, matched) but never given a value in: {}", var, rule)
            }
            SafetyError::UnsafeNegation { rule, var } => {
                write!(f, "Unsafe negation: variable '{}' only appears negated in: {}", var, rule)
            }
            SafetyError::UnsafeAggregation { rule, var } => {
                write!(f, "Unsafe aggregation: variable '{}' not bound outside aggregate in: {}", var, rule)
            }
            SafetyError::FunctionAsCondition { rule, function } => {
                write!(f, "{}", crate::errors::function_as_condition_message(function, rule))
            }
            SafetyError::DisjunctionInside { rule } => {
                write!(f, "{}", VerifyError::DisjunctionInside { rule: rule.clone() })
            }
            SafetyError::AggregateOutside { rule, function } => {
                write!(f, "{}", crate::errors::aggregate_outside_message(function, rule))
            }
        }
    }
}

impl std::error::Error for SafetyError {}

impl From<SafetyError> for VerifyError {
    fn from(e: SafetyError) -> Self {
        match e {
            SafetyError::UnboundHeadVar { rule, var } => {
                VerifyError::UnboundHeadVar { var, rule }
            }
            SafetyError::UnboundComparedVar { rule, var } => {
                VerifyError::UnboundComparedVar { var, rule }
            }
            SafetyError::UnsafeNegation { rule, var } => {
                VerifyError::UnsafeNegation { var, rule }
            }
            SafetyError::UnsafeAggregation { rule, var } => {
                VerifyError::UnsafeAggregation { var, rule }
            }
            SafetyError::FunctionAsCondition { rule, function } => {
                VerifyError::FunctionAsCondition { function, rule }
            }
            SafetyError::DisjunctionInside { rule } => VerifyError::DisjunctionInside { rule },
            SafetyError::AggregateOutside { rule, function } => VerifyError::AggregateOutside { function, rule },
        }
    }
}

impl From<SafetyError> for crate::errors::SynalogError {
    fn from(e: SafetyError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// Get the source text of a rule for error messages.
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

/// Check 1: All head variables must be positively bound in body.
///
/// Variables are positively bound if they appear in:
/// - A positive predicate call (not negated, not a comparison)
/// - The left side of an inclusion (x in List)
/// - A unification
fn check_head_vars_bound(rule: &Json) -> Vec<SafetyError> {
    if is_fact(rule) {
        return vec![];
    }

    let text = rule_text(rule);
    let head_vars = VarCollector::head_vars(rule);
    let mut positive_vars = VarCollector::positive_vars(rule);
    // A value-function's argument variables are inputs (bound by the caller),
    // so they count as bound; the returned value still has to be body-bound.
    positive_vars.extend(VarCollector::function_input_vars(rule));

    head_vars
        .iter()
        .filter(|v| *v != "_" && !positive_vars.contains(*v))
        .map(|v| SafetyError::UnboundHeadVar {
            rule: text.clone(),
            var: v.clone(),
        })
        .collect()
}


/// Check 2: Safe negation - negated variables must appear positively.
fn check_safe_negation(rule: &Json) -> Vec<SafetyError> {
    if is_fact(rule) {
        return vec![];
    }

    let text = rule_text(rule);
    let mut positive_vars = VarCollector::positive_vars(rule);
    positive_vars.extend(VarCollector::function_input_vars(rule));
    let negated_vars = VarCollector::negated_vars(rule);

    negated_vars
        .iter()
        .filter(|v| *v != "_" && !positive_vars.contains(*v))
        .map(|v| SafetyError::UnsafeNegation {
            rule: text.clone(),
            var: v.clone(),
        })
        .collect()
}

/// Check 3: Safe aggregation - aggregated variables must be bound outside.
fn check_safe_aggregation(rule: &Json) -> Vec<SafetyError> {
    if is_fact(rule) {
        return vec![];
    }

    let text = rule_text(rule);
    let mut positive_vars = VarCollector::positive_vars(rule);
    positive_vars.extend(VarCollector::function_input_vars(rule));
    let agg_vars = VarCollector::aggregation_vars(rule);

    agg_vars
        .iter()
        .filter(|v| *v != "_" && !positive_vars.contains(*v))
        .map(|v| SafetyError::UnsafeAggregation {
            rule: text.clone(),
            var: v.clone(),
        })
        .collect()
}

/// Check 4: a variable compared in the body (`x > 2`) must get its value from
/// somewhere else in the body: a comparison filters, it does not bind.
fn check_compared_vars_bound(rule: &Json) -> Vec<SafetyError> {
    if is_fact(rule) {
        return vec![];
    }
    let text = rule_text(rule);
    let mut positive_vars = VarCollector::positive_vars(rule);
    positive_vars.extend(VarCollector::function_input_vars(rule));
    // A head variable that is not bound is already reported, once.
    let head_vars = VarCollector::head_vars(rule);
    let mut compared: Vec<String> = VarCollector::compared_vars(rule).into_iter().collect();
    compared.sort();
    compared
        .into_iter()
        .filter(|v| v != "_" && !positive_vars.contains(v) && !head_vars.contains(v))
        .map(|v| SafetyError::UnboundComparedVar { rule: text.clone(), var: v })
        .collect()
}

/// Run all safety checks on a single rule.
pub fn check_rule_safety(rule: &Json) -> Vec<SafetyError> {
    let mut errors = Vec::new();
    errors.extend(check_head_vars_bound(rule));
    errors.extend(check_compared_vars_bound(rule));
    errors.extend(check_safe_negation(rule));
    errors.extend(check_safe_aggregation(rule));
    errors
}

/// Run all safety checks on a program's rules.
pub fn check_safety(rules: &[&Json]) -> Vec<SafetyError> {
    let mut errors: Vec<SafetyError> = rules.iter().flat_map(|r| check_rule_safety(r)).collect();
    errors.extend(check_functions_as_conditions(rules));
    errors.extend(check_disjunctions_inside(rules));
    errors.extend(check_aggregates_outside(rules));
    errors
}

/// The aggregates: built in, and the program's names for them
/// (`Top2(x) = ArgMaxK(x, 2);`).
const AGGREGATES: &[&str] = &[
    "Sum", "Count", "ExactCount", "Min", "Max", "Avg", "List", "Set", "Array", "StringAgg",
    "Median", "SomeValue", "AnyValue", "ArgMax", "ArgMin", "ArgMaxK", "ArgMinK", "ArrayConcatAgg",
];

/// An aggregate called where nothing aggregates: as a plain value
/// (`Q(t: Sum(p)) distinct`) or in a condition (`p == Max(p)`), which SQL
/// refuses (`GROUP BY` or `WHERE` holding an aggregate); and `ArgMaxK` or
/// `ArgMinK` aggregating without the number of values to keep.
fn check_aggregates_outside(rules: &[&Json]) -> Vec<SafetyError> {
    fn call_of(e: &Json) -> Option<(&str, usize)> {
        let c = e.as_object().get("call").filter(|c| c.is_object())?.as_object();
        let name = c.get("predicate_name").filter(|n| n.is_string())?.as_str();
        let n = c.get("record")
            .and_then(|r| r.as_object().get("field_value"))
            .map(|fvs| fvs.as_array().len())
            .unwrap_or(0);
        Some((name, n))
    }
    fn value_of(fv: &Json) -> &Json {
        let val = &fv.as_object()["value"];
        val.as_object().get("expression").unwrap_or(val)
    }
    // The program's names for aggregates: functions whose value is one.
    let mut aggregates: HashSet<String> = AGGREGATES.iter().map(|s| s.to_string()).collect();
    loop {
        let before = aggregates.len();
        for rule in rules {
            let head = rule.as_object()["head"].as_object();
            let Some(fvs) = head.get("record").and_then(|r| r.as_object().get("field_value")) else { continue };
            for fv in fvs.as_array() {
                let f = &fv.as_object()["field"];
                if f.is_string() && f.as_str() == "logica_value" {
                    if call_of(value_of(fv)).is_some_and(|(n, _)| aggregates.contains(n)) {
                        aggregates.insert(head["predicate_name"].as_str().to_string());
                    }
                }
            }
        }
        if aggregates.len() == before {
            break;
        }
    }
    fn walk(json: &Json, aggregates: &HashSet<String>, found: &mut Vec<String>) {
        match json {
            Json::Object(o) => {
                if let Some(agg) = o.get("aggregation") {
                    // An aggregation's operator is its aggregate: a K one
                    // needs its count.
                    let e = agg.as_object().get("expression").unwrap_or(agg);
                    if let Some((name, n)) = call_of(e) {
                        if (name == "ArgMaxK" || name == "ArgMinK") && n < 2 {
                            found.push(name.to_string());
                        }
                        if let Some(fvs) = e.as_object()["call"].as_object().get("record")
                            .and_then(|r| r.as_object().get("field_value")) {
                            for fv in fvs.as_array() {
                                walk(value_of(fv), aggregates, found);
                            }
                        }
                    }
                    return;
                }
                if let Some((name, _)) = call_of(json) {
                    if aggregates.contains(name) {
                        found.push(name.to_string());
                    }
                }
                for (key, v) in o.iter() {
                    if key != "aggregation" {
                        walk(v, aggregates, found);
                    }
                }
            }
            Json::Array(items) => items.iter().for_each(|i| walk(i, aggregates, found)),
            _ => {}
        }
    }
    let mut errors = Vec::new();
    for rule in rules {
        let head = rule.as_object()["head"].as_object();
        if head["predicate_name"].as_str().starts_with('@') {
            continue;
        }
        let mut found = Vec::new();
        if let Some(fvs) = head.get("record").and_then(|r| r.as_object().get("field_value")) {
            for fv in fvs.as_array() {
                let f = &fv.as_object()["field"];
                // A function's value may be an aggregate: it names one.
                if !(f.is_string() && f.as_str() == "logica_value") {
                    walk(&fv.as_object()["value"], &aggregates, &mut found);
                }
            }
        }
        if let Some(body) = rule.as_object().get("body") {
            walk(body, &aggregates, &mut found);
        }
        let mut seen = HashSet::new();
        for function in found {
            if seen.insert(function.clone()) {
                errors.push(SafetyError::AggregateOutside { rule: rule_text(rule), function });
            }
        }
    }
    errors
}

/// A disjunction among the conditions of a combine (an aggregate expression,
/// or a negation `~(A | B)`, which is one): the compiler writes each combine
/// as one query and cannot split it into alternatives.
fn check_disjunctions_inside(rules: &[&Json]) -> Vec<SafetyError> {
    fn has_disjunction_in_combine(json: &Json) -> bool {
        match json {
            Json::Object(o) => {
                if let Some(combine) = o.get("combine") {
                    let conjuncts = combine.as_object().get("body")
                        .and_then(|b| b.as_object().get("conjunction"))
                        .and_then(|c| c.as_object().get("conjunct"));
                    if conjuncts.is_some_and(|cs| cs.as_array().iter().any(|c| c.as_object().contains_key("disjunction"))) {
                        return true;
                    }
                }
                o.values().any(has_disjunction_in_combine)
            }
            Json::Array(items) => items.iter().any(has_disjunction_in_combine),
            _ => false,
        }
    }
    rules.iter()
        .filter(|r| has_disjunction_in_combine(r))
        .map(|r| SafetyError::DisjunctionInside { rule: rule_text(r) })
        .collect()
}

/// A function (`F(x) = ...`) written as a condition, `F(x)` in a body: a
/// function has a row for every argument, whatever its value, so the
/// condition holds for every `x`, also where `F(x)` is false. Its value is
/// compared instead (`F(x) == true`).
fn check_functions_as_conditions(rules: &[&Json]) -> Vec<SafetyError> {
    let has_value = |record: &Json| {
        record.as_object().get("field_value").is_some_and(|fvs| {
            fvs.as_array().iter().any(|fv| {
                let field = &fv.as_object()["field"];
                field.is_string() && field.as_str() == "logica_value"
            })
        })
    };
    // Functions: predicates every rule of which defines a value.
    let mut defines: std::collections::HashMap<String, bool> = std::collections::HashMap::new();
    for rule in rules {
        let head = rule.as_object()["head"].as_object();
        let name = head["predicate_name"].as_str().to_string();
        let value = head.get("record").is_some_and(|r| has_value(r));
        defines.entry(name).and_modify(|all| *all &= value).or_insert(value);
    }
    fn conditions<'a>(json: &'a Json, out: &mut Vec<&'a Json>) {
        match json {
            Json::Object(o) => {
                if let Some(p) = o.get("predicate") {
                    out.push(p);
                }
                for (key, value) in o.iter() {
                    if key != "predicate" {
                        conditions(value, out);
                    }
                }
            }
            Json::Array(items) => items.iter().for_each(|i| conditions(i, out)),
            _ => {}
        }
    }
    let mut errors = Vec::new();
    for rule in rules {
        let Some(body) = rule.as_object().get("body") else { continue };
        let mut found = Vec::new();
        conditions(body, &mut found);
        for p in found {
            let name = p.as_object()["predicate_name"].as_str();
            let is_function = defines.get(name).copied().unwrap_or(false);
            if is_function && !p.as_object().get("record").is_some_and(|r| has_value(r)) {
                errors.push(SafetyError::FunctionAsCondition {
                    rule: rule_text(rule),
                    function: name.to_string(),
                });
            }
        }
    }
    errors
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    fn parse(code: &str) -> Json {
        parse_file(code, None, &[]).unwrap()
    }

    fn program_safety(code: &str) -> Vec<String> {
        let parsed = parse(code);
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        check_safety(&rules).iter().map(|e| e.to_string()).collect()
    }

    #[test]
    fn test_a_disjunction_inside_a_combine_is_refused() {
        let errors = program_safety("V(x: 1);\nQ(x:) :- V(x:), ~(V(x: 2) | V(x: 3));");
        assert!(errors.iter().any(|e| e.contains("A disjunction inside a negation or a combine")), "{errors:?}");
        let errors = program_safety("V(x: 1);\nQ(t:) :- t == (combine += 1 :- V(x:), (x == 1 | x == 2));");
        assert!(errors.iter().any(|e| e.contains("A disjunction inside")), "{errors:?}");
        // At the top of a body, a disjunction is alternatives of the rule.
        assert!(program_safety("V(x: 1);\nQ(x:) :- V(x:), (x == 1 | x == 2);").is_empty());
    }

    #[test]
    fn test_function_as_a_condition_is_refused() {
        let errors = program_safety("IsEven(x) = (x % 2 == 0);\nV(x: 1);\nE(x:) :- V(x:), IsEven(x);\n");
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert!(errors[0].contains("'IsEven' is a function"), "{}", errors[0]);
    }

    #[test]
    fn test_function_value_compared_is_safe() {
        let errors = program_safety("IsEven(x) = (x % 2 == 0);\nV(x: 1);\nE(x:) :- V(x:), IsEven(x) == true;\n");
        assert!(errors.is_empty(), "{:?}", errors);
    }

    #[test]
    fn test_fact_is_safe() {
        let parsed = parse("Person(\"Alice\");");
        let rules = parsed.as_object()["rule"].as_array();
        let errors = check_rule_safety(&rules[0]);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_bound_vars_safe() {
        let parsed = parse("Adult(name:) :- Person(name:, age:), age > 18;");
        let rules = parsed.as_object()["rule"].as_array();
        let errors = check_rule_safety(&rules[0]);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_compared_but_unbound_var() {
        let parsed = parse("V(y:) :- y in [1], x > 2;");
        let errors = check_rule_safety(&parsed.as_object()["rule"].as_array()[0]);
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert!(matches!(&errors[0], SafetyError::UnboundComparedVar { var, .. } if var == "x"));
    }

    #[test]
    fn test_a_combine_compared_binds_its_own_variables() {
        let errors = program_safety("V(g: 1, x: 2);\nQ(g:) :- V(g:, x:), x > (combine Avg= w :- V(g:, x: w));");
        assert!(errors.is_empty(), "{:?}", errors);
        let errors = program_safety("V(g: 1, x: 2);\nQ(g:) :- V(g:), (combine Min= x :- V(g:, x:)) > 1;");
        assert!(errors.is_empty(), "{:?}", errors);
    }

    #[test]
    fn test_compared_and_bound_var() {
        let parsed = parse("V(y:) :- y in [1, 3], y > 2;");
        assert!(check_rule_safety(&parsed.as_object()["rule"].as_array()[0]).is_empty());
    }

    #[test]
    fn test_unbound_head_var() {
        let parsed = parse("Test(x, y) :- Source(x);");
        let rules = parsed.as_object()["rule"].as_array();
        let errors = check_rule_safety(&rules[0]);
        assert!(errors.iter().any(|e| matches!(e, SafetyError::UnboundHeadVar { var, .. } if var == "y")));
    }

    #[test]
    fn test_value_function_with_body_args_are_inputs() {
        // A value-function's argument variables are inputs, not body-bound; the
        // returned value (here bound by `n == x + 1`) is. This must pass.
        let parsed = parse("Inc(x) = n :- n == x + 1;");
        let rules = parsed.as_object()["rule"].as_array();
        assert!(
            check_rule_safety(&rules[0]).is_empty(),
            "value-function input args must count as bound: {:?}",
            check_rule_safety(&rules[0])
        );
    }

    #[test]
    fn test_value_function_multi_arg_with_helper_call() {
        // Mirrors the temporal `DaysInMonth(y, m)` doc helper: multiple inputs,
        // an intermediate var, and a conditional value.
        let parsed = parse(
            "DaysInMonth(y, m) = n :- \
               leap == (if y % 4 == 0 then 1 else 0), \
               n == (if m == 2 then 28 + leap else 31);",
        );
        let rules = parsed.as_object()["rule"].as_array();
        assert!(check_rule_safety(&rules[0]).is_empty());
    }

    #[test]
    fn test_value_function_unbound_return_value_still_flagged() {
        // The fix must not blanket-exempt function heads: a return value that
        // the body never binds is still an error.
        let parsed = parse("Bad(x) = n :- x > 0;");
        let rules = parsed.as_object()["rule"].as_array();
        assert!(
            check_rule_safety(&rules[0])
                .iter()
                .any(|e| matches!(e, SafetyError::UnboundHeadVar { var, .. } if var == "n")),
            "unbound function return value must still be flagged"
        );
    }
}
