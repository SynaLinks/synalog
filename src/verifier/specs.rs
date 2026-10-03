// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Specifications (`@Spec`) and proofs (`@Proof`).
//!
//! A program states properties of its predicates with `@Spec`. Each property
//! is anchored to a predicate and named by a named argument; its statement is
//! a first-order formula in the syntax of a Lean proposition (see
//! [`crate::spec`]):
//!
//! ```text
//! @Spec(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
//! ```
//!
//! The statement says what the rules are meant to compute in a notation that
//! is not Synalog, so a mistake in the rules is unlikely to be repeated in it.
//! It is checked against a database: its counterexamples are a predicate like
//! any other, compiled to SQL (see [`spec_check`]).
//!
//! A spec is meant to be written *before* the predicates it constrains, so a
//! statement naming a predicate that does not exist yet is not an error: the
//! spec is [`SpecStatus::Pending`].
//!
//! `@Proof` attaches a proof text to a spec of the same predicate and name.
//! Proofs are recorded, not checked.
//!
//! ## What is checked
//!
//! Errors are reserved for specs that can never become valid: a statement that
//! does not parse or contradicts the program (wrong number of arguments), a
//! proof with no matching spec, a name stated or proved twice, and annotations
//! that are not shaped as `(Predicate, name: "text", ...)`. A well-formed
//! statement that cannot be checked on a database is a warning.

use std::collections::{HashMap, HashSet};

use crate::errors::VerifyError;
use crate::parser::Json;
use crate::spec::{self, Schema, TranslateError, Translation};

use super::reserved::reserved_predicate_names;

/// Where a spec stands.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SpecStatus {
    /// The anchor predicate, or a predicate the statement names, is not
    /// defined yet.
    Pending,
    /// The statement can be checked against a database.
    Unchecked,
    /// The statement is well-formed but cannot be checked against a database.
    Unsupported,
}

impl SpecStatus {
    pub fn as_str(&self) -> &'static str {
        match self {
            SpecStatus::Pending => "pending",
            SpecStatus::Unchecked => "unchecked",
            SpecStatus::Unsupported => "unsupported",
        }
    }
}

impl std::fmt::Display for SpecStatus {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(self.as_str())
    }
}

/// One named spec of a predicate, with its proof if one is written.
#[derive(Debug, Clone)]
pub struct SpecReport {
    /// The anchor predicate.
    pub predicate: String,
    /// The spec's name (the named argument of `@Spec`).
    pub name: String,
    /// The statement, verbatim.
    pub statement: String,
    /// The proof text from the matching `@Proof`, verbatim.
    pub proof: Option<String>,
    pub status: SpecStatus,
    /// Why the spec is pending (the predicates it waits for) or unsupported.
    pub detail: Option<String>,
}

/// `@Spec` / `@Proof` annotation error.
#[derive(Debug, Clone)]
pub enum SpecError {
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
    /// The same spec name is stated twice for a predicate.
    DuplicateSpec { predicate: String, name: String },
    /// The same spec name is proved twice for a predicate.
    DuplicateProof { predicate: String, name: String },
    /// A `@Proof` names a spec that no `@Spec` states.
    OrphanProof { predicate: String, name: String },
}

impl std::fmt::Display for SpecError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SpecError::Malformed { annotation, reason, .. } => {
                write!(f, "Malformed {}: {}", annotation, reason)
            }
            SpecError::Statement { predicate, name, reason } => {
                write!(f, "Invalid spec '{}.{}': {}", predicate, name, reason)
            }
            SpecError::DuplicateSpec { predicate, name } => {
                write!(f, "Duplicate spec '{}.{}': it is stated more than once", predicate, name)
            }
            SpecError::DuplicateProof { predicate, name } => {
                write!(f, "Duplicate proof of '{}.{}': it is proved more than once", predicate, name)
            }
            SpecError::OrphanProof { predicate, name } => write!(
                f,
                "Proof of '{}.{}' has no matching @Spec: state it with @Spec({}, {}: \"...\")",
                predicate, name, predicate, name
            ),
        }
    }
}

impl std::error::Error for SpecError {}

impl From<SpecError> for VerifyError {
    fn from(e: SpecError) -> Self {
        match e {
            SpecError::Malformed { annotation, reason, rule } => {
                VerifyError::MalformedSpecAnnotation { annotation, reason, rule }
            }
            SpecError::Statement { predicate, name, reason } => {
                VerifyError::InvalidSpec { predicate, name, reason }
            }
            SpecError::DuplicateSpec { predicate, name } => {
                VerifyError::DuplicateSpec { predicate, name }
            }
            SpecError::DuplicateProof { predicate, name } => {
                VerifyError::DuplicateProof { predicate, name }
            }
            SpecError::OrphanProof { predicate, name } => {
                VerifyError::OrphanProof { predicate, name }
            }
        }
    }
}

impl From<SpecError> for crate::errors::SynalogError {
    fn from(e: SpecError) -> Self {
        crate::errors::SynalogError::Verify(e.into())
    }
}

/// One `(predicate, name) -> text` entry of a `@Spec` or `@Proof` annotation.
struct Entry {
    predicate: String,
    name: String,
    text: String,
}

/// Pair every `@Spec` with its `@Proof` and report where each spec stands.
///
/// `rules` must include the annotation rules. Reports come back in source
/// order of the `@Spec` annotations.
pub fn check_specs(rules: &[&Json]) -> (Vec<SpecReport>, Vec<SpecError>) {
    let mut errors = Vec::new();
    let mut defined = HashSet::new();
    let mut specs = Vec::new();
    let mut proofs = Vec::new();
    let schema = spec::schema(rules);

    for rule in rules {
        let name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        match name {
            "@Spec" => specs.extend(read_annotation(rule, name, &mut errors)),
            "@Proof" => proofs.extend(read_annotation(rule, name, &mut errors)),
            // A functor application (`P := F(A: B)`) defines `P` without a rule head.
            "@Make" => defined.extend(made_predicate(rule)),
            _ if !name.starts_with('@') => {
                defined.insert(name.to_string());
            }
            _ => {}
        }
    }

    let mut reports: Vec<SpecReport> = Vec::new();
    let mut index: HashMap<(String, String), usize> = HashMap::new();
    for spec in specs {
        let key = (spec.predicate.clone(), spec.name.clone());
        if index.contains_key(&key) {
            errors.push(SpecError::DuplicateSpec {
                predicate: spec.predicate,
                name: spec.name,
            });
            continue;
        }
        index.insert(key, reports.len());
        let (status, detail) = match translate_spec(&spec, &defined, &schema) {
            Ok(_) => (SpecStatus::Unchecked, None),
            Err(TranslateError::Missing(missing)) => (
                SpecStatus::Pending,
                Some(format!("waiting for {}", missing.join(", "))),
            ),
            Err(TranslateError::Unsupported(reason)) => (SpecStatus::Unsupported, Some(reason)),
            Err(TranslateError::Invalid(reason)) => {
                errors.push(SpecError::Statement {
                    predicate: spec.predicate.clone(),
                    name: spec.name.clone(),
                    reason,
                });
                (SpecStatus::Unsupported, None)
            }
        };
        reports.push(SpecReport {
            predicate: spec.predicate,
            name: spec.name,
            statement: spec.text,
            proof: None,
            status,
            detail,
        });
    }

    for proof in proofs {
        let key = (proof.predicate.clone(), proof.name.clone());
        let Some(&i) = index.get(&key) else {
            errors.push(SpecError::OrphanProof {
                predicate: proof.predicate,
                name: proof.name,
            });
            continue;
        };
        let report = &mut reports[i];
        if report.proof.is_some() {
            errors.push(SpecError::DuplicateProof {
                predicate: proof.predicate,
                name: proof.name,
            });
            continue;
        }
        report.proof = Some(proof.text);
    }

    (reports, errors)
}

/// Translate the statement of `spec` into the rules of its counterexamples.
fn translate_spec(
    spec: &Entry,
    defined: &HashSet<String>,
    schema: &Schema,
) -> Result<Translation, TranslateError> {
    let statement = spec::parse(&spec.text).map_err(|e| TranslateError::Invalid(e.to_string()))?;
    let translation = spec::translate(
        &statement,
        schema,
        &spec::check_predicate(&spec.predicate, &spec.name),
    )?;
    if !is_defined(&spec.predicate, defined) {
        return Err(TranslateError::Missing(vec![spec.predicate.clone()]));
    }
    Ok(translation)
}

/// The rules that find the counterexamples of the spec `name` of `predicate`:
/// the spec holds on a database when the translation's predicate is empty
/// there. `rules` must include the annotation rules.
pub fn spec_check(rules: &[&Json], predicate: &str, name: &str) -> Result<Translation, String> {
    let mut errors = Vec::new();
    let mut defined = HashSet::new();
    let mut found = None;
    for rule in rules {
        let head = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        match head {
            "@Spec" => {
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
        return Err(format!("No spec '{}.{}'", predicate, name));
    };
    translate_spec(&entry, &defined, &spec::schema(rules)).map_err(|e| match e {
        TranslateError::Missing(missing) => format!(
            "Spec '{}.{}' is pending: waiting for {}",
            predicate,
            name,
            missing.join(", ")
        ),
        TranslateError::Invalid(reason) => format!("Invalid spec '{}.{}': {}", predicate, name, reason),
        TranslateError::Unsupported(reason) => {
            format!("Spec '{}.{}' cannot be checked: {}", predicate, name, reason)
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
fn made_predicate(rule: &Json) -> Option<String> {
    let head = rule.as_object()["head"].as_object();
    let first = head.get("record")?.as_object().get("field_value")?.as_array().first()?;
    let value = &first.as_object()["value"];
    predicate_name(value.as_object().get("expression").unwrap_or(value))
}

/// Read the entries of one `@Spec` / `@Proof` annotation rule, reporting a
/// malformed annotation into `errors`.
fn read_annotation(rule: &Json, annotation: &str, errors: &mut Vec<SpecError>) -> Vec<Entry> {
    let mut malformed = |reason: String| {
        errors.push(SpecError::Malformed {
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
fn predicate_name(value: &Json) -> Option<String> {
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
fn string_literal(value: &Json) -> Option<String> {
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
        r#"@Spec(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");"#;
    const RULE: &str = "Ancestor(x:, y:) :- parent(x:, y:);";

    fn check(code: &str) -> (Vec<SpecReport>, Vec<SpecError>) {
        let parsed = parse_file(code, None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        check_specs(&rules)
    }

    #[test]
    fn test_spec_before_predicate_is_pending() {
        let (reports, errors) = check(TRANSITIVE);
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports.len(), 1);
        assert_eq!(reports[0].predicate, "Ancestor");
        assert_eq!(reports[0].name, "transitive");
        assert_eq!(reports[0].statement, "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
        assert_eq!(reports[0].status, SpecStatus::Pending);
        assert_eq!(reports[0].detail.as_deref(), Some("waiting for Ancestor"));
    }

    #[test]
    fn test_spec_waits_for_every_predicate_it_names() {
        let (reports, errors) = check(&format!(
            "{RULE}\n{}",
            r#"@Spec(Ancestor, known: "∀ x y, Ancestor x y → Person x ∧ Person y");"#
        ));
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Pending);
        assert_eq!(reports[0].detail.as_deref(), Some("waiting for Person"));
    }

    #[test]
    fn test_spec_of_defined_predicate_is_unchecked() {
        let (reports, errors) = check(&format!("{TRANSITIVE}\n{RULE}"));
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Unchecked);
        assert_eq!(reports[0].detail, None);
        assert_eq!(reports[0].proof, None);
    }

    #[test]
    fn test_proof_is_recorded() {
        let (reports, errors) = check(&format!(
            "{TRANSITIVE}\n{RULE}\n{}",
            r#"@Proof(Ancestor, transitive: "intro h1 h2; induction h2 <;> aesop");"#
        ));
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Unchecked);
        assert_eq!(reports[0].proof.as_deref(), Some("intro h1 h2; induction h2 <;> aesop"));
    }

    #[test]
    fn test_several_specs_merge_across_annotations() {
        let (reports, errors) = check(&format!(
            "{}\n{RULE}",
            r#"
            @Spec(Ancestor, transitive: "Ancestor x y → Ancestor y z → Ancestor x z",
                            irreflexive: "¬ Ancestor x x");
            @Spec(Ancestor, positive: "∀ x, x > 0");
            "#
        ));
        assert!(errors.is_empty(), "{errors:?}");
        let got: Vec<(&str, SpecStatus)> =
            reports.iter().map(|r| (r.name.as_str(), r.status)).collect();
        assert_eq!(
            got,
            vec![
                ("transitive", SpecStatus::Unchecked),
                ("irreflexive", SpecStatus::Unchecked),
                ("positive", SpecStatus::Unsupported),
            ]
        );
        assert!(reports[2].detail.as_deref().unwrap().contains("variable 'x' is not bound"));
    }

    #[test]
    fn test_spec_on_functor_made_predicate_is_not_pending() {
        // `Managers` has no rule head, so its columns are unknown: a statement
        // can be anchored to it but cannot apply it.
        let (reports, errors) = check(
            r#"
            @Spec(Managers, closed: "∀ x y, Reports x y → Reports x y");
            Closure(x:, y:) :- Edge(x:, y:);
            Reports(x:, y:) :- reports(x:, y:);
            Managers := Closure(Edge: Reports);
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_ne!(reports[0].status, SpecStatus::Pending);
    }

    #[test]
    fn test_statement_that_does_not_parse() {
        let (_, errors) = check(&format!(
            "{RULE}\n{}",
            r#"@Spec(Ancestor, transitive: "∀ x y, Ancestor x y →");"#
        ));
        assert!(
            matches!(&errors[..], [SpecError::Statement { reason, .. }]
                if reason.contains("end of the statement")),
            "{errors:?}"
        );
    }

    #[test]
    fn test_statement_with_wrong_number_of_arguments() {
        let (_, errors) = check(&format!(
            "{RULE}\n{}",
            r#"@Spec(Ancestor, irreflexive: "∀ x, ¬ Ancestor x");"#
        ));
        assert!(
            matches!(&errors[..], [SpecError::Statement { reason, .. }]
                if reason.contains("'Ancestor' has 2 columns (x, y)")),
            "{errors:?}"
        );
    }

    #[test]
    fn test_spec_check_gives_the_counterexample_rules() {
        let parsed = parse_file(&format!("{TRANSITIVE}\n{RULE}"), None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let translation = spec_check(&rules, "Ancestor", "transitive").unwrap();
        assert_eq!(translation.predicate, "Spec_Ancestor_transitive");
        assert_eq!(translation.columns, vec!["x", "y", "z"]);
        assert_eq!(
            translation.rules,
            "Spec_Ancestor_transitive(x: x, y: y, z: z) distinct :- \
             Ancestor(x: x, y: y), Ancestor(x: y, y: z), ~Ancestor(x: x, y: z);"
        );

        let err = spec_check(&rules, "Ancestor", "symmetric").unwrap_err();
        assert_eq!(err, "No spec 'Ancestor.symmetric'");
    }

    #[test]
    fn test_spec_check_of_a_pending_spec() {
        let parsed = parse_file(TRANSITIVE, None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let err = spec_check(&rules, "Ancestor", "transitive").unwrap_err();
        assert_eq!(err, "Spec 'Ancestor.transitive' is pending: waiting for Ancestor");
    }

    #[test]
    fn test_triple_quoted_statement() {
        let (reports, errors) = check(&format!(
            "{RULE}\n{}",
            "@Spec(Ancestor, transitive: \"\"\"∀ x y z,\n  Ancestor x y →\n  Ancestor y z →\n  Ancestor x z\"\"\");"
        ));
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Unchecked);
    }

    #[test]
    fn test_orphan_proof() {
        let (reports, errors) = check(&format!(
            "{RULE}\n{}",
            r#"@Proof(Ancestor, transitive: "aesop");"#
        ));
        assert!(reports.is_empty());
        assert!(
            matches!(&errors[..], [SpecError::OrphanProof { predicate, name }]
                if predicate == "Ancestor" && name == "transitive"),
            "{errors:?}"
        );
    }

    #[test]
    fn test_duplicate_spec_and_proof() {
        let (reports, errors) = check(
            r#"
            @Spec(Ancestor, irreflexive: "¬ Ancestor x x");
            @Spec(Ancestor, irreflexive: "∀ x, ¬ Ancestor x x");
            @Proof(Ancestor, irreflexive: "aesop");
            @Proof(Ancestor, irreflexive: "simp");
        "#,
        );
        assert_eq!(reports.len(), 1);
        assert_eq!(reports[0].statement, "¬ Ancestor x x");
        assert_eq!(reports[0].proof.as_deref(), Some("aesop"));
        assert!(
            matches!(
                &errors[..],
                [SpecError::DuplicateSpec { .. }, SpecError::DuplicateProof { .. }]
            ),
            "{errors:?}"
        );
    }

    #[test]
    fn test_malformed_annotations() {
        for code in [
            r#"@Spec(Ancestor);"#,
            r#"@Spec(Ancestor, "Ancestor x y");"#,
            r#"@Spec(transitive: "Ancestor x y");"#,
            r#"@Spec("Ancestor", transitive: "Ancestor x y");"#,
            r#"@Spec(Ancestor, transitive: 1);"#,
            r#"@Proof(Ancestor, transitive: Ancestor);"#,
        ] {
            let (reports, errors) = check(code);
            assert!(reports.is_empty(), "{code}: {reports:?}");
            assert!(
                matches!(&errors[..], [SpecError::Malformed { .. }]),
                "{code}: {errors:?}"
            );
        }
    }
}
