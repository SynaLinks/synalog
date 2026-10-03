// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Specifications (`@Assert`).
//!
//! A program states properties of its predicates with `@Assert`. Each property
//! is anchored to a predicate and named by a named argument; its statement is
//! a first-order formula in the syntax of a Lean proposition (see
//! [`crate::assertion`]):
//!
//! ```text
//! @Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
//! ```
//!
//! The statement says what the rules are meant to compute in a notation that
//! is not Synalog, so a mistake in the rules is unlikely to be repeated in it.
//! It is checked against a database: its counterexamples are a predicate like
//! any other, compiled to SQL (see [`assertion_check`]).
//!
//! An assertion is meant to be written *before* the predicates it constrains, so a
//! statement naming a predicate that does not exist yet is not an error: the
//! assertion is [`AssertionStatus::Pending`].
//!
//! ## What is checked
//!
//! Errors are reserved for assertions that can never become valid: a statement that
//! does not parse or contradicts the program (wrong number of arguments), a
//! name stated twice, and annotations that are not shaped as
//! `(Predicate, name: "text", ...)`. A well-formed
//! statement that cannot be checked on a database is a warning.

use std::collections::{HashMap, HashSet};

use crate::errors::VerifyError;
use crate::parser::Json;
use crate::assertion::{self, Schema, TranslateError, Translation};

use super::reserved::reserved_predicate_names;

/// Where an assertion stands.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum AssertionStatus {
    /// The anchor predicate, or a predicate the statement names, is not
    /// defined yet.
    Pending,
    /// The statement can be checked against a database.
    Unchecked,
    /// The statement is well-formed but cannot be checked against a database.
    Unsupported,
}

impl AssertionStatus {
    pub fn as_str(&self) -> &'static str {
        match self {
            AssertionStatus::Pending => "pending",
            AssertionStatus::Unchecked => "unchecked",
            AssertionStatus::Unsupported => "unsupported",
        }
    }
}

impl std::fmt::Display for AssertionStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(self.as_str())
    }
}

/// One named assertion of a predicate.
#[derive(Debug, Clone)]
pub struct AssertionReport {
    /// The anchor predicate.
    pub predicate: String,
    /// The assertion's name (the named argument of `@Assert`).
    pub name: String,
    /// The statement, verbatim.
    pub statement: String,
    pub status: AssertionStatus,
    /// Why the assertion is pending (the predicates it waits for) or unsupported.
    pub detail: Option<String>,
}

/// `@Assert` annotation error.
#[derive(Debug, Clone)]
pub enum AssertionError {
    /// The annotation is not shaped as `(Predicate, name: "text", ...)`.
    Malformed {
        annotation: String,
        reason: String,
        rule: String,
    },
    /// The statement does not parse, or contradicts the program.
    Statement {
        predicate: String,
        name: String,
        reason: String,
    },
    /// The same assertion name is stated twice for a predicate.
    DuplicateAssertion { predicate: String, name: String },
}

impl std::fmt::Display for AssertionError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            AssertionError::Malformed { annotation, reason, .. } => {
                write!(f, "Malformed {}: {}", annotation, reason)
            }
            AssertionError::Statement { predicate, name, reason } => {
                write!(f, "Invalid assertion '{}.{}': {}", predicate, name, reason)
            }
            AssertionError::DuplicateAssertion { predicate, name } => {
                write!(f, "Duplicate assertion '{}.{}': it is stated more than once", predicate, name)
            }
        }
    }
}

impl std::error::Error for AssertionError {}

impl From<AssertionError> for VerifyError {
    fn from(e: AssertionError) -> Self {
        match e {
            AssertionError::Malformed { annotation, reason, rule } => {
                VerifyError::MalformedAssertion { annotation, reason, rule }
            }
            AssertionError::Statement { predicate, name, reason } => {
                VerifyError::InvalidAssertion { predicate, name, reason }
            }
            AssertionError::DuplicateAssertion { predicate, name } => {
                VerifyError::DuplicateAssertion { predicate, name }
            }
        }
    }
}

impl From<AssertionError> for crate::errors::SynalogError {
    fn from(e: AssertionError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// One `(predicate, name) -> statement` entry of an `@Assert` annotation.
struct Entry {
    predicate: String,
    name: String,
    text: String,
}

/// Report where each `@Assert` of the program stands.
///
/// `rules` must include the annotation rules. Reports come back in source
/// order of the `@Assert` annotations.
pub fn check_assertions(rules: &[&Json]) -> (Vec<AssertionReport>, Vec<AssertionError>) {
    let mut errors = Vec::new();
    let mut defined = HashSet::new();
    let mut assertions = Vec::new();
    let schema = assertion::schema(rules);

    for rule in rules {
        let name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        match name {
            "@Assert" => assertions.extend(read_annotation(rule, name, &mut errors)),
            // A functor application (`P := F(A: B)`) defines `P` without a rule head.
            "@Make" => defined.extend(made_predicate(rule)),
            _ if !name.starts_with('@') => {
                defined.insert(name.to_string());
            }
            _ => {}
        }
    }

    let mut reports: Vec<AssertionReport> = Vec::new();
    let mut index: HashMap<(String, String), usize> = HashMap::new();
    for assertion in assertions {
        let key = (assertion.predicate.clone(), assertion.name.clone());
        if index.contains_key(&key) {
            errors.push(AssertionError::DuplicateAssertion {
                predicate: assertion.predicate,
                name: assertion.name,
            });
            continue;
        }
        index.insert(key, reports.len());
        let (status, detail) = match translate_assertion(&assertion, &defined, &schema) {
            Ok(_) => (AssertionStatus::Unchecked, None),
            Err(TranslateError::Missing(missing)) => (
                AssertionStatus::Pending,
                Some(format!("waiting for {}", missing.join(", "))),
            ),
            Err(TranslateError::Unsupported(reason)) => (AssertionStatus::Unsupported, Some(reason)),
            Err(TranslateError::Invalid(reason)) => {
                errors.push(AssertionError::Statement {
                    predicate: assertion.predicate.clone(),
                    name: assertion.name.clone(),
                    reason,
                });
                (AssertionStatus::Unsupported, None)
            }
        };
        reports.push(AssertionReport {
            predicate: assertion.predicate,
            name: assertion.name,
            statement: assertion.text,
            status,
            detail,
        });
    }

    (reports, errors)
}

/// Translate the statement of `assertion` into the rules of its counterexamples.
fn translate_assertion(
    assertion: &Entry,
    defined: &HashSet<String>,
    schema: &Schema,
) -> Result<Translation, TranslateError> {
    let statement = assertion::parse(&assertion.text).map_err(|e| TranslateError::Invalid(e.to_string()))?;
    let translation = assertion::translate(
        &statement,
        schema,
        &assertion::check_predicate(&assertion.predicate, &assertion.name),
    )?;
    if !is_defined(&assertion.predicate, defined) {
        return Err(TranslateError::Missing(vec![assertion.predicate.clone()]));
    }
    Ok(translation)
}

/// The rules that find the counterexamples of the assertion `name` of `predicate`:
/// the assertion holds on a database when the translation's predicate is empty
/// there. `rules` must include the annotation rules.
pub fn assertion_check(rules: &[&Json], predicate: &str, name: &str) -> Result<Translation, String> {
    let mut errors = Vec::new();
    let mut defined = HashSet::new();
    let mut found = None;
    for rule in rules {
        let head = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        match head {
            "@Assert" => {
                for entry in read_annotation(rule, head, &mut errors) {
                    if entry.predicate == predicate && entry.name == name && found.is_none() {
                        found = Some(entry);
                    }
                }
            }
            "@Make" => defined.extend(made_predicate(rule)),
            _ if !head.starts_with('@') => {
                defined.insert(head.to_string());
            }
            _ => {}
        }
    }
    let Some(entry) = found else {
        return Err(format!("No assertion '{}.{}'", predicate, name));
    };
    translate_assertion(&entry, &defined, &assertion::schema(rules)).map_err(|e| match e {
        TranslateError::Missing(missing) => format!(
            "Assertion '{}.{}' is pending: waiting for {}",
            predicate,
            name,
            missing.join(", ")
        ),
        TranslateError::Invalid(reason) => format!("Invalid assertion '{}.{}': {}", predicate, name, reason),
        TranslateError::Unsupported(reason) => {
            format!("Assertion '{}.{}' cannot be checked: {}", predicate, name, reason)
        }
    })
}

/// True if `predicate` exists: defined by a rule, a built-in library predicate,
/// or a raw database table (lowercase names are tables, see `undefined`).
fn is_defined(predicate: &str, defined: &HashSet<String>) -> bool {
    defined.contains(predicate)
        || reserved_predicate_names().contains(predicate)
        || !predicate.chars().next().is_some_and(|c| c.is_ascii_uppercase())
}

/// The predicate a `@Make` functor application defines (its first argument).
pub(super) fn made_predicate(rule: &Json) -> Option<String> {
    let head = rule.as_object()["head"].as_object();
    let first = head.get("record")?.as_object().get("field_value")?.as_array().first()?;
    let value = &first.as_object()["value"];
    predicate_name(value.as_object().get("expression").unwrap_or(value))
}

/// Read the entries of one `@Assert` annotation rule, reporting a
/// malformed annotation into `errors`.
fn read_annotation(rule: &Json, annotation: &str, errors: &mut Vec<AssertionError>) -> Vec<Entry> {
    let mut malformed = |reason: String| {
        errors.push(AssertionError::Malformed {
            annotation: annotation.to_string(),
            reason,
            rule: rule_text(rule),
        });
        Vec::new()
    };
    let expected = format!("expected {}(Predicate, name: \"...\")", annotation);

    let head = rule.as_object()["head"].as_object();
    let field_values = head
        .get("record")
        .and_then(|r| r.as_object().get("field_value"))
        .map(|fvs| fvs.as_array().as_slice())
        .unwrap_or_default();

    let mut predicate = None;
    let mut named = Vec::new();
    for fv in field_values {
        let field = &fv.as_object()["field"];
        let value = &fv.as_object()["value"];
        let value = value.as_object().get("expression").unwrap_or(value);
        if field.is_int() {
            if field.as_int() != 0 {
                return malformed(format!("unexpected positional argument; {}", expected));
            }
            predicate = predicate_name(value);
        } else {
            let name = field.as_str().to_string();
            match string_literal(value) {
                Some(text) => named.push((name, text)),
                None => return malformed(format!("'{}' must be a string", name)),
            }
        }
    }

    let Some(predicate) = predicate else {
        return malformed(format!("the first argument must be a predicate; {}", expected));
    };
    if named.is_empty() {
        return malformed(format!("no named argument; {}", expected));
    }

    named
        .into_iter()
        .map(|(name, text)| Entry {
            predicate: predicate.clone(),
            name,
            text,
        })
        .collect()
}

/// The predicate an annotation argument names (`Ancestor`, or a lowercase raw
/// table, which parses as a variable).
pub(super) fn predicate_name(value: &Json) -> Option<String> {
    if !value.is_object() {
        return None;
    }
    let obj = value.as_object();
    if let Some(var) = obj.get("variable") {
        return Some(var.as_object()["var_name"].as_var_name());
    }
    let pred = obj.get("literal")?.as_object().get("the_predicate")?;
    Some(pred.as_object()["predicate_name"].as_str().to_string())
}

/// The text of a string literal expression.
pub(super) fn string_literal(value: &Json) -> Option<String> {
    if !value.is_object() {
        return None;
    }
    let the_string = value.as_object().get("literal")?.as_object().get("the_string")?;
    if the_string.is_string() {
        return Some(the_string.as_str().to_string());
    }
    let inner = the_string.as_object().get("the_string")?;
    Some(inner.as_str().to_string())
}

/// Source text of a rule for error context.
fn rule_text(rule: &Json) -> String {
    rule.as_object()
        .get("full_text")
        .map(|j| j.as_str().to_string())
        .unwrap_or_else(|| "<unknown>".to_string())
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    const TRANSITIVE: &str =
        r#"@Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");"#;
    const RULE: &str = "Ancestor(x:, y:) :- parent(x:, y:);";

    fn check(code: &str) -> (Vec<AssertionReport>, Vec<AssertionError>) {
        let parsed = parse_file(code, None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        check_assertions(&rules)
    }

    #[test]
    fn test_spec_before_predicate_is_pending() {
        let (reports, errors) = check(TRANSITIVE);
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports.len(), 1);
        assert_eq!(reports[0].predicate, "Ancestor");
        assert_eq!(reports[0].name, "transitive");
        assert_eq!(reports[0].statement, "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
        assert_eq!(reports[0].status, AssertionStatus::Pending);
        assert_eq!(reports[0].detail.as_deref(), Some("waiting for Ancestor"));
    }

    #[test]
    fn test_spec_waits_for_every_predicate_it_names() {
        let (reports, errors) = check(&format!(
            "{RULE}\n{}",
            r#"@Assert(Ancestor, known: "∀ x y, Ancestor x y → Person x ∧ Person y");"#
        ));
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, AssertionStatus::Pending);
        assert_eq!(reports[0].detail.as_deref(), Some("waiting for Person"));
    }

    #[test]
    fn test_spec_of_defined_predicate_is_unchecked() {
        let (reports, errors) = check(&format!("{TRANSITIVE}\n{RULE}"));
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, AssertionStatus::Unchecked);
        assert_eq!(reports[0].detail, None);
    }

    #[test]
    fn test_several_specs_merge_across_annotations() {
        let (reports, errors) = check(&format!(
            "{}\n{RULE}",
            r#"
            @Assert(Ancestor, transitive: "Ancestor x y → Ancestor y z → Ancestor x z",
                            irreflexive: "¬ Ancestor x x");
            @Assert(Ancestor, positive: "∀ x, x > 0");
            "#
        ));
        assert!(errors.is_empty(), "{errors:?}");
        let got: Vec<(&str, AssertionStatus)> =
            reports.iter().map(|r| (r.name.as_str(), r.status)).collect();
        assert_eq!(
            got,
            vec![
                ("transitive", AssertionStatus::Unchecked),
                ("irreflexive", AssertionStatus::Unchecked),
                ("positive", AssertionStatus::Unsupported),
            ]
        );
        assert!(reports[2].detail.as_deref().unwrap().contains("variable 'x' is not bound"));
    }

    #[test]
    fn test_spec_applying_a_functor_result_is_unchecked() {
        // A functor's result has the columns of the predicate it instantiates,
        // so a statement can apply it, through a chain of functors too.
        let (reports, errors) = check(
            r#"
            @Assert(Big, positive: "∀ r, Big r → r > 0");
            @Assert(Bigger, positive: "∀ r, Bigger r → r > 0");
            Large(customer_id:) :- customer_id in [1, 2];
            Larger(customer_id:) :- customer_id in [2];
            Revenue(revenue? += 1) distinct :- Segment(customer_id:);
            Segment(customer_id:) :- customer_id in [1, 2, 3];
            Big := Revenue(Segment: Large);
            Bigger := Big(Large: Larger);
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        for report in &reports {
            assert_eq!(report.status, AssertionStatus::Unchecked, "{report:?}");
        }
    }

    #[test]
    fn test_spec_on_functor_made_predicate_is_not_pending() {
        // `Managers` has no rule head, so its columns are unknown: a statement
        // can be anchored to it but cannot apply it.
        let (reports, errors) = check(
            r#"
            @Assert(Managers, closed: "∀ x y, Reports x y → Reports x y");
            Closure(x:, y:) :- Edge(x:, y:);
            Reports(x:, y:) :- reports(x:, y:);
            Managers := Closure(Edge: Reports);
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_ne!(reports[0].status, AssertionStatus::Pending);
    }

    #[test]
    fn test_statement_that_does_not_parse() {
        let (_, errors) = check(&format!(
            "{RULE}\n{}",
            r#"@Assert(Ancestor, transitive: "∀ x y, Ancestor x y →");"#
        ));
        assert!(
            matches!(&errors[..], [AssertionError::Statement { reason, .. }]
                if reason.contains("end of the statement")),
            "{errors:?}"
        );
    }

    #[test]
    fn test_statement_with_wrong_number_of_arguments() {
        let (_, errors) = check(&format!(
            "{RULE}\n{}",
            r#"@Assert(Ancestor, irreflexive: "∀ x, ¬ Ancestor x");"#
        ));
        assert!(
            matches!(&errors[..], [AssertionError::Statement { reason, .. }]
                if reason.contains("'Ancestor' has 2 columns (x, y)")),
            "{errors:?}"
        );
    }

    #[test]
    fn test_spec_check_gives_the_counterexample_rules() {
        let parsed = parse_file(&format!("{TRANSITIVE}\n{RULE}"), None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let translation = assertion_check(&rules, "Ancestor", "transitive").unwrap();
        assert_eq!(translation.predicate, "Assert_Ancestor_transitive");
        assert_eq!(translation.columns, vec!["x", "y", "z"]);
        assert_eq!(
            translation.rules,
            "Assert_Ancestor_transitive(x: x, y: y, z: z) distinct :- \
             Ancestor(x: x, y: y), Ancestor(x: y, y: z), ~Ancestor(x: x, y: z);"
        );

        let err = assertion_check(&rules, "Ancestor", "symmetric").unwrap_err();
        assert_eq!(err, "No assertion 'Ancestor.symmetric'");
    }

    #[test]
    fn test_spec_check_of_a_pending_spec() {
        let parsed = parse_file(TRANSITIVE, None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let err = assertion_check(&rules, "Ancestor", "transitive").unwrap_err();
        assert_eq!(err, "Assertion 'Ancestor.transitive' is pending: waiting for Ancestor");
    }

    #[test]
    fn test_triple_quoted_statement() {
        let (reports, errors) = check(&format!(
            "{RULE}\n{}",
            "@Assert(Ancestor, transitive: \"\"\"∀ x y z,\n  Ancestor x y →\n  Ancestor y z →\n  Ancestor x z\"\"\");"
        ));
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, AssertionStatus::Unchecked);
    }

    #[test]
    fn test_duplicate_spec() {
        let (reports, errors) = check(
            r#"
            @Assert(Ancestor, irreflexive: "¬ Ancestor x x");
            @Assert(Ancestor, irreflexive: "∀ x, ¬ Ancestor x x");
        "#,
        );
        assert_eq!(reports.len(), 1);
        assert_eq!(reports[0].statement, "¬ Ancestor x x");
        assert!(matches!(&errors[..], [AssertionError::DuplicateAssertion { .. }]), "{errors:?}");
    }

    #[test]
    fn test_malformed_annotations() {
        for code in [
            r#"@Assert(Ancestor);"#,
            r#"@Assert(Ancestor, "Ancestor x y");"#,
            r#"@Assert(transitive: "Ancestor x y");"#,
            r#"@Assert("Ancestor", transitive: "Ancestor x y");"#,
            r#"@Assert(Ancestor, transitive: 1);"#,
            r#"@Assert(Ancestor, transitive: Ancestor);"#,
        ] {
            let (reports, errors) = check(code);
            assert!(reports.is_empty(), "{code}: {reports:?}");
            assert!(
                matches!(&errors[..], [AssertionError::Malformed { .. }]),
                "{code}: {errors:?}"
            );
        }
    }
}
