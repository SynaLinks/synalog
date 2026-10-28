// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Arity consistency checks for Synalog rules.
//!
//! Ensures predicates are used consistently:
//! - All definitions of a predicate have the same arity
//! - Positional usages of a predicate match its definition arity
//! - Named usages only reference columns that the definition provides
//!   (referencing a subset of columns is valid and idiomatic)

use std::collections::{HashMap, HashSet};
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
    /// A head names the same column twice.
    DuplicateColumn {
        predicate: String,
        column: String,
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
            ArityError::DuplicateColumn {
                predicate, column, ..
            } => {
                write!(f, "Column '{}' appears twice in the head of '{}'", column, predicate)
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
            ArityError::DuplicateColumn {
                predicate, column, ..
            } => VerifyError::DuplicateColumn { predicate, column },
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

    // A positional call to a predicate defined by name has no positional arity
    // to compare with: the positional-arguments check reports it.
    if shape.positional_arity > 0
        && def.positional_arity > 0
        && shape.positional_arity != def.positional_arity
    {
        errors.push(ArityError::Mismatch {
            predicate: pred_name.to_string(),
            expected: def.positional_arity,
            actual: shape.positional_arity,
            rule: rule_txt.to_string(),
        });
    }

    // The call's columns the definition does not provide, decided by the
    // Verus-proved synalog_verified::membership::absent. Names are interned to
    // u64 symbols (a column shared by call and definition gets one id), and the
    // call's columns are sorted so the unknown ones are reported in order.
    let mut call_cols: Vec<&String> = shape.named_fields.iter().collect();
    call_cols.sort();
    let mut ids: HashMap<&str, u64> = HashMap::new();
    let mut next: u64 = 0;
    let mut allowed_ids: Vec<u64> = Vec::with_capacity(def.named_fields.len());
    for c in &def.named_fields {
        let id = *ids.entry(c.as_str()).or_insert_with(|| {
            let id = next;
            next += 1;
            id
        });
        allowed_ids.push(id);
    }
    let mut col_ids: Vec<u64> = Vec::with_capacity(call_cols.len());
    let mut name_of: HashMap<u64, &str> = HashMap::new();
    for c in &call_cols {
        let id = *ids.entry(c.as_str()).or_insert_with(|| {
            let id = next;
            next += 1;
            id
        });
        name_of.insert(id, c.as_str());
        col_ids.push(id);
    }
    for id in synalog_verified::membership::absent(&col_ids, &allowed_ids) {
        errors.push(ArityError::UnknownColumn {
            predicate: pred_name.to_string(),
            column: name_of[&id].to_string(),
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

    // Collect each definition's (predicate, arity) in order, interning names to
    // u64 symbols; the inconsistency decision is the Verus-proved
    // synalog_verified::arity::first_arity_conflict.
    let mut ids: HashMap<&str, u64> = HashMap::new();
    let mut next: u64 = 0;
    let mut defs: Vec<(u64, usize)> = Vec::new();
    // Per definition, the data an InconsistentDefinition error needs.
    let mut meta: Vec<(&str, usize, String)> = Vec::new();

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

        // A head naming the same column twice — the first such repeat, found by
        // the Verus-proved synalog_verified::membership::first_duplicate over
        // the head's column names interned to u64 symbols.
        let mut columns: Vec<&str> = Vec::new();
        if let Some(fvs) = head.as_object().get("record").and_then(|r| r.as_object().get("field_value")) {
            for fv in fvs.as_array() {
                let field = &fv.as_object()["field"];
                if field.is_string() {
                    columns.push(field.as_str());
                }
            }
        }
        let mut col_ids_map: HashMap<&str, u64> = HashMap::new();
        let mut col_next: u64 = 0;
        let col_ids: Vec<u64> = columns
            .iter()
            .map(|c| *col_ids_map.entry(c).or_insert_with(|| {
                let id = col_next;
                col_next += 1;
                id
            }))
            .collect();
        if let Some((_, j)) = synalog_verified::membership::first_duplicate(&col_ids) {
            errors.push(ArityError::DuplicateColumn {
                predicate: pred_name.to_string(),
                column: columns[j].to_string(),
                rule: rule_txt.clone(),
            });
        }

        let id = match ids.get(pred_name) {
            Some(&id) => id,
            None => {
                let id = next;
                next += 1;
                ids.insert(pred_name, id);
                id
            }
        };
        defs.push((id, arity));
        meta.push((pred_name, arity, rule_txt));
    }

    if let Some((i, j)) = synalog_verified::arity::first_arity_conflict(&defs) {
        errors.push(ArityError::InconsistentDefinition {
            predicate: meta[i].0.to_string(),
            first_arity: meta[i].1,
            first_rule: meta[i].2.clone(),
            second_arity: meta[j].1,
            second_rule: meta[j].2.clone(),
        });
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

        // A negation `~P(...)` is `IsNull(combine ...)`: P is in the argument.
        collect_expr_usage_errors(pred, definitions, rule_txt, errors);

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
    let obj = match expr {
        Json::Object(obj) => obj,
        Json::Array(items) => {
            for item in items {
                collect_expr_usage_errors(item, definitions, rule_txt, errors);
            }
            return;
        }
        _ => return,
    };

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
        return;
    }

    // Anything else: a combine may sit deeper, in an argument.
    for (key, value) in obj.iter() {
        if key != "combine" {
            collect_expr_usage_errors(value, definitions, rule_txt, errors);
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
    fn test_positional_call_to_a_named_predicate_is_not_an_arity_mismatch() {
        let parsed = parse(
            r#"
            Item(x:) :- x in [1, 2];
            Total(x:) :- Item(x);
        "#,
        );
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        assert!(check_usage_arity(&rules).is_empty());
    }

    #[test]
    fn test_unknown_column_inside_negation() {
        let parsed = parse(
            r#"
            Edge(a: 1, b: 2);
            Node(x:) :- x in [1];
            Sink(x:) :- Node(x:), ~Edge(nope: x);
        "#,
        );
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_usage_arity(&rules);
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert!(matches!(&errors[0], ArityError::UnknownColumn { column, .. } if column == "nope"));
    }

    #[test]
    fn test_duplicate_column_in_head() {
        let parsed = parse("V(x:, x:) :- x in [1];");
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let errors = check_consistent_definitions(&rules);
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert_eq!(errors[0].to_string(), "Column 'x' appears twice in the head of 'V'");
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
