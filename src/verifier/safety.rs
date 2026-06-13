// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Variable safety checks for Logica rules.
//!
//! Mirrors the Lean 4 specification:
//! - All head variables must appear in body (range restriction)
//! - Variables in negated predicates must appear positively
//! - Variables in aggregations must be bound outside the aggregate

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
}

impl std::fmt::Display for SafetyError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SafetyError::UnboundHeadVar { rule, var } => {
                write!(f, "Unbound variable '{}' in head of rule: {}", var, rule)
            }
            SafetyError::UnsafeNegation { rule, var } => {
                write!(f, "Unsafe negation: variable '{}' only appears negated in: {}", var, rule)
            }
            SafetyError::UnsafeAggregation { rule, var } => {
                write!(f, "Unsafe aggregation: variable '{}' not bound outside aggregate in: {}", var, rule)
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
            SafetyError::UnsafeNegation { rule, var } => {
                VerifyError::UnsafeNegation { var, rule }
            }
            SafetyError::UnsafeAggregation { rule, var } => {
                VerifyError::UnsafeAggregation { var, rule }
            }
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

/// Run all safety checks on a single rule.
pub fn check_rule_safety(rule: &Json) -> Vec<SafetyError> {
    let mut errors = Vec::new();
    errors.extend(check_head_vars_bound(rule));
    errors.extend(check_safe_negation(rule));
    errors.extend(check_safe_aggregation(rule));
    errors
}

/// Run all safety checks on a program's rules.
pub fn check_safety(rules: &[&Json]) -> Vec<SafetyError> {
    rules.iter().flat_map(|r| check_rule_safety(r)).collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    fn parse(code: &str) -> Json {
        parse_file(code, None, &[]).unwrap()
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
