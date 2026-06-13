// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Arity consistency checks for Synalog rules.
//!
//! Ensures predicates are used consistently:
//! - All definitions of a predicate have the same arity
//! - Positional usages of a predicate match its definition arity
//! - Named usages only reference columns that the definition provides
//!   (referencing a subset of columns is valid and idiomatic)

use std::collections::{BTreeSet, HashMap, HashSet};
use crate::parser::Json;
use crate::errors::VerifyError;

/// Arity check error.
#[derive(Debug, Clone)]
pub enum ArityError {
    /// Same predicate defined with different arities.
    InconsistentDefinition {
        predicate: String,
        first_arity: usize,
        first_rule: String,
        second_arity: usize,
        second_rule: String,
    },
    /// Predicate used with wrong arity.
    Mismatch {
        predicate: String,
        expected: usize,
        actual: usize,
        rule: String,
    },
    /// Named call references a column the definition does not provide.
    UnknownColumn {
        predicate: String,
        column: String,
        rule: String,
    },
}

impl std::fmt::Display for ArityError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ArityError::InconsistentDefinition {
                predicate,
                first_arity,
                second_arity,
                ..
            } => {
                write!(
                    f,
                    "Predicate '{}' defined with inconsistent arities: {} and {}",
                    predicate, first_arity, second_arity
                )
            }
            ArityError::Mismatch {
                predicate,
                expected,
                actual,
                ..
            } => {
                write!(
                    f,
                    "Arity mismatch for '{}': expected {} arguments, got {}",
                    predicate, expected, actual
                )
            }
            ArityError::UnknownColumn {
                predicate, column, ..
            } => {
                write!(
                    f,
                    "Unknown column '{}' for predicate '{}'",
                    column, predicate
                )
            }
        }
    }
}

impl std::error::Error for ArityError {}

impl From<ArityError> for VerifyError {
    fn from(e: ArityError) -> Self {
        match e {
            ArityError::InconsistentDefinition {
                predicate,
                first_arity,
                second_arity,
                ..
            } => VerifyError::ArityMismatch {
                predicate,
                expected: first_arity,
                actual: second_arity,
            },
            ArityError::Mismatch {
                predicate,
                expected,
                actual,
                ..
            } => VerifyError::ArityMismatch {
                predicate,
                expected,
                actual,
            },
            ArityError::UnknownColumn {
                predicate, column, ..
            } => VerifyError::UnknownColumn { predicate, column },
        }
    }
}

impl From<ArityError> for crate::errors::SynalogError {
    fn from(e: ArityError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// Predicate info: arity and defining rule.
#[derive(Debug, Clone)]
struct PredicateInfo {
    arity: usize,
    rule_text: String,
}

/// Field shape of a predicate: positional argument count and named columns.
#[derive(Debug, Clone, Default)]
struct FieldShape {
    positional_arity: usize,
    named_fields: HashSet<String>,
}

/// Extract the field shape of a head or call node holding a `record`.
fn field_shape(node: &Json) -> FieldShape {
    let mut shape = FieldShape::default();
    if let Some(fvs) = node
        .as_object()
        .get("record")
        .and_then(|r| r.as_object().get("field_value"))
    {
        for fv in fvs.as_array() {
            match fv.as_object().get("field") {
                Some(field) if field.is_string() => {
                    shape.named_fields.insert(field.as_str().to_string());
                }
                Some(_) => shape.positional_arity += 1,
                None => {}
            }
        }
    }
    shape
}

/// Collect predicate definitions from rules, merging the field shapes of all
/// definitions of the same predicate.
fn collect_definitions(rules: &[&Json]) -> HashMap<String, FieldShape> {
    let mut definitions: HashMap<String, FieldShape> = HashMap::new();

    for rule in rules {
        let obj = rule.as_object();
        let head = &obj["head"];
        let pred_name = head.as_object()["predicate_name"].as_str();

        // Skip annotations
        if pred_name.starts_with('@') {
            continue;
        }

        let shape = field_shape(head);
        let entry = definitions.entry(pred_name.to_string()).or_default();
        entry.positional_arity = entry.positional_arity.max(shape.positional_arity);
        entry.named_fields.extend(shape.named_fields);
    }

    definitions
}

/// Count arguments in head.
fn count_head_args(head: &Json) -> usize {
    head.as_object()
        .get("record")
        .and_then(|r| r.as_object().get("field_value"))
        .map(|fv| fv.as_array().len())
        .unwrap_or(0)
}

/// Check one call site against the definition's field shape.
///
/// Positional calls must match the positional arity exactly. Named calls may
/// reference any subset of the defined columns; unknown names are errors.
fn check_call_shape(
    pred_name: &str,
    call: &Json,
    def: &FieldShape,
    rule_txt: &str,
    errors: &mut Vec<ArityError>,
) {
    let shape = field_shape(call);

    if shape.positional_arity > 0 && shape.positional_arity != def.positional_arity {
        errors.push(ArityError::Mismatch {
            predicate: pred_name.to_string(),
            expected: def.positional_arity,
            actual: shape.positional_arity,
            rule: rule_txt.to_string(),
        });
    }

    let unknown: BTreeSet<&String> = shape
        .named_fields
        .iter()
        .filter(|name| !def.named_fields.contains(*name))
        .collect();
    for name in unknown {
        errors.push(ArityError::UnknownColumn {
            predicate: pred_name.to_string(),
            column: name.clone(),
            rule: rule_txt.to_string(),
        });
    }
}

/// Get rule text for error messages.
fn rule_text(rule: &Json) -> String {
    rule.as_object()
        .get("full_text")
        .map(|j| j.as_str().to_string())
        .unwrap_or_else(|| "<unknown>".to_string())
}

/// Check that all definitions of a predicate have the same arity.
pub fn check_consistent_definitions(rules: &[&Json]) -> Vec<ArityError> {
    let mut errors = Vec::new();
    let mut first_definition: HashMap<String, PredicateInfo> = HashMap::new();

    for rule in rules {
        let obj = rule.as_object();
        let head = &obj["head"];
        let pred_name = head.as_object()["predicate_name"].as_str();

        // Skip annotations
        if pred_name.starts_with('@') {
            continue;
        }

        let arity = count_head_args(head);
        let rule_txt = rule_text(rule);

        if let Some(first) = first_definition.get(pred_name) {
            if first.arity != arity {
                errors.push(ArityError::InconsistentDefinition {
                    predicate: pred_name.to_string(),
                    first_arity: first.arity,
                    first_rule: first.rule_text.clone(),
                    second_arity: arity,
                    second_rule: rule_txt,
                });
            }
        } else {
            first_definition.insert(
                pred_name.to_string(),
                PredicateInfo {
                    arity,
                    rule_text: rule_txt,
                },
            );
        }
    }

    errors
}

/// Check that all usages match definition arities.
pub fn check_usage_arity(rules: &[&Json]) -> Vec<ArityError> {
    let definitions = collect_definitions(rules);
    let mut errors = Vec::new();

    for rule in rules {
        let rule_txt = rule_text(rule);

        // Check body predicates
        if let Some(body) = rule.as_object().get("body") {
            collect_usage_errors(body, &definitions, &rule_txt, &mut errors);
        }
    }

    errors
}

/// Recursively collect arity errors from body.
fn collect_usage_errors(
    body: &Json,
    definitions: &HashMap<String, FieldShape>,
    rule_txt: &str,
    errors: &mut Vec<ArityError>,
) {
    let obj = body.as_object();

    if let Some(conj) = obj.get("conjunction") {
        if let Some(conjuncts) = conj.as_object().get("conjunct") {
            for c in conjuncts.as_array() {
                collect_conjunct_usage_errors(c, definitions, rule_txt, errors);
            }
        }
    }
}

fn collect_conjunct_usage_errors(
    conjunct: &Json,
    definitions: &HashMap<String, FieldShape>,
    rule_txt: &str,
    errors: &mut Vec<ArityError>,
) {
    let obj = conjunct.as_object();

    // Predicate call
    if let Some(pred) = obj.get("predicate") {
        let pred_name = pred.as_object()["predicate_name"].as_str();

        // Skip built-ins and comparisons
        if pred_name.starts_with('@') || is_builtin(pred_name) {
            return;
        }

        if let Some(def) = definitions.get(pred_name) {
            check_call_shape(pred_name, pred, def, rule_txt, errors);
        }
        return;
    }

    // Disjunction - recurse
    if let Some(disj) = obj.get("disjunction") {
        if let Some(branches) = disj.as_object().get("disjunct") {
            for branch in branches.as_array() {
                collect_usage_errors(branch, definitions, rule_txt, errors);
            }
        }
    }

    // Unification - check for predicate calls in expressions
    if let Some(unif) = obj.get("unification") {
        if let Some(rhs) = unif.as_object().get("right_hand_side") {
            collect_expr_usage_errors(rhs, definitions, rule_txt, errors);
        }
        if let Some(lhs) = unif.as_object().get("left_hand_side") {
            collect_expr_usage_errors(lhs, definitions, rule_txt, errors);
        }
    }
}

fn collect_expr_usage_errors(
    expr: &Json,
    definitions: &HashMap<String, FieldShape>,
    rule_txt: &str,
    errors: &mut Vec<ArityError>,
) {
    let obj = expr.as_object();

    // Call expression
    if let Some(call) = obj.get("call") {
        let pred_name = call.as_object()["predicate_name"].as_str();

        if !pred_name.starts_with('@') && !is_builtin(pred_name) {
            if let Some(def) = definitions.get(pred_name) {
                check_call_shape(pred_name, call, def, rule_txt, errors);
            }
        }
    }

    // Combine - recurse into inner rule
    if let Some(combine) = obj.get("combine") {
        if let Some(body) = combine.as_object().get("body") {
            collect_usage_errors(body, definitions, rule_txt, errors);
        }
    }
}

/// Check if a predicate name is a built-in.
fn is_builtin(name: &str) -> bool {
    const BUILTINS: &[&str] = &[
        // Comparison operators
        ">", "<", ">=", "<=", "==", "!=", "<>",
        // Logic
        "IsNull", "!",
        // Aggregations
        "Sum", "Count", "Min", "Max", "Avg", "List", "Array", "ArrayConcat",
        // Common functions
        "Range", "If", "Cast", "ToString", "ToInt", "ToFloat",
        "Abs", "Floor", "Ceil", "Round", "Sqrt", "Log", "Exp", "Pow",
        "Length", "Substr", "Concat", "Upper", "Lower", "Trim",
        "Split", "Join", "Replace", "RegexpMatch", "RegexpExtract",
        "Date", "Timestamp", "DateDiff", "DateAdd",
        "JsonParse", "JsonExtract", "JsonArray",
    ];
    BUILTINS.contains(&name)
}

/// Run all arity checks.
pub fn check_arity(rules: &[&Json]) -> Vec<ArityError> {
    let mut errors = Vec::new();
    errors.extend(check_consistent_definitions(rules));
    errors.extend(check_usage_arity(rules));
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
    fn test_consistent_arity_ok() {
        let parsed = parse(
            r#"
            Data(x, y) :- x in Range(5), y == x * 2;
            Data(a, b) :- a in Range(3), b == a + 1;
        "#,
        );
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_consistent_definitions(&rules);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_inconsistent_arity() {
        let parsed = parse(
            r#"
            Multi(x, y) :- x in Range(5), y == x * 2;
            Multi(a, b, c) :- a in Range(3), b == a + 1, c == b + 1;
        "#,
        );
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_consistent_definitions(&rules);
        assert_eq!(errors.len(), 1);
        assert!(matches!(
            &errors[0],
            ArityError::InconsistentDefinition { predicate, first_arity: 2, second_arity: 3, .. }
            if predicate == "Multi"
        ));
    }

    #[test]
    fn test_usage_arity_ok() {
        let parsed = parse(
            r#"
            Data(x, y) :- x in Range(5), y == x * 2;
            Test(a, b) :- Data(a, b);
        "#,
        );
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_usage_arity(&rules);
        assert!(errors.is_empty());
    }

    #[test]
    fn test_usage_arity_mismatch() {
        let parsed = parse(
            r#"
            Data(x, y) :- x in Range(5), y == x * 2;
            Test(a, b, c) :- Data(a, b, c);
        "#,
        );
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_usage_arity(&rules);
        assert_eq!(errors.len(), 1);
        assert!(matches!(
            &errors[0],
            ArityError::Mismatch { predicate, expected: 2, actual: 3, .. }
            if predicate == "Data"
        ));
    }
}
