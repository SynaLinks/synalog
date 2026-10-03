// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Specifications and proofs (`@Spec` / `@Proof`).
//!
//! A program states properties of its predicates with `@Spec` and justifies
//! them with `@Proof`. Both are anchored to a predicate and name each property
//! with a named argument:
//!
//! ```text
//! @Spec(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");
//! @Proof(Ancestor, transitive: "intro x y z h1 h2; induction h2 <;> aesop");
//! ```
//!
//! The two are deliberately separate annotations. The statement is the
//! contract and lives only in `@Spec`; a `@Proof` carries no statement of its
//! own, so whoever writes the proof cannot weaken what is being proved.
//!
//! A spec is meant to be written *before* the predicate it constrains, so a
//! spec anchored to a predicate that does not exist yet is not an error: it is
//! reported as [`SpecStatus::Pending`].
//!
//! ## What is checked
//!
//! This pass is structural only — it pairs specs with proofs and reports where
//! each spec stands. It does not run Lean: a spec that has a proof is reported
//! as [`SpecStatus::Unverified`], never as proven.
//!
//! Errors are reserved for annotations that can never become valid: a proof
//! with no matching spec, a name stated or proved twice, and annotations that
//! are not shaped as `(Predicate, name: "text", ...)`.

use std::collections::{HashMap, HashSet};

use crate::errors::VerifyError;
use crate::parser::Json;

use super::reserved::reserved_predicate_names;

/// Where a spec stands.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SpecStatus {
    /// The anchor predicate is not defined yet.
    Pending,
    /// The anchor predicate is defined but the spec has no `@Proof`.
    Unproven,
    /// A `@Proof` is written but has not been checked.
    Unverified,
}

impl SpecStatus {
    pub fn as_str(&self) -> &'static str {
        match self {
            SpecStatus::Pending => "pending",
            SpecStatus::Unproven => "unproven",
            SpecStatus::Unverified => "unverified",
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
        let status = if is_defined(&spec.predicate, &defined) {
            SpecStatus::Unproven
        } else {
            SpecStatus::Pending
        };
        reports.push(SpecReport {
            predicate: spec.predicate,
            name: spec.name,
            statement: spec.text,
            proof: None,
            status,
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
        // A proof of a predicate that does not exist yet proves nothing.
        if report.status == SpecStatus::Unproven {
            report.status = SpecStatus::Unverified;
        }
    }

    (reports, errors)
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

    fn check(code: &str) -> (Vec<SpecReport>, Vec<SpecError>) {
        let parsed = parse_file(code, None, &[]).unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        check_specs(&rules)
    }

    #[test]
    fn test_spec_before_predicate_is_pending() {
        let (reports, errors) = check(
            r#"@Spec(Ancestor, transitive: "Ancestor x y → Ancestor y z → Ancestor x z");"#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports.len(), 1);
        assert_eq!(reports[0].predicate, "Ancestor");
        assert_eq!(reports[0].name, "transitive");
        assert_eq!(reports[0].statement, "Ancestor x y → Ancestor y z → Ancestor x z");
        assert_eq!(reports[0].status, SpecStatus::Pending);
    }

    #[test]
    fn test_spec_without_proof_is_unproven() {
        let (reports, errors) = check(
            r#"
            @Spec(Ancestor, transitive: "Ancestor x y → Ancestor y z → Ancestor x z");
            Ancestor(x:, y:) :- parent(x:, y:);
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Unproven);
        assert_eq!(reports[0].proof, None);
    }

    #[test]
    fn test_spec_with_proof_is_unverified() {
        let (reports, errors) = check(
            r#"
            @Spec(Ancestor, transitive: "Ancestor x y → Ancestor y z → Ancestor x z");
            Ancestor(x:, y:) :- parent(x:, y:);
            @Proof(Ancestor, transitive: "intro h1 h2; induction h2 <;> aesop");
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Unverified);
        assert_eq!(reports[0].proof.as_deref(), Some("intro h1 h2; induction h2 <;> aesop"));
    }

    #[test]
    fn test_proof_of_missing_predicate_stays_pending() {
        let (reports, errors) = check(
            r#"
            @Spec(Ancestor, transitive: "Ancestor x y → Ancestor y z → Ancestor x z");
            @Proof(Ancestor, transitive: "aesop");
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Pending);
    }

    #[test]
    fn test_several_specs_merge_across_annotations() {
        let (reports, errors) = check(
            r#"
            @Spec(Ancestor, transitive: "A", irreflexive: "B");
            @Spec(Ancestor, grounded: "C");
            Ancestor(x:, y:) :- parent(x:, y:);
            @Proof(Ancestor, grounded: "aesop");
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        let got: Vec<(&str, SpecStatus)> =
            reports.iter().map(|r| (r.name.as_str(), r.status)).collect();
        assert_eq!(
            got,
            vec![
                ("transitive", SpecStatus::Unproven),
                ("irreflexive", SpecStatus::Unproven),
                ("grounded", SpecStatus::Unverified),
            ]
        );
    }

    #[test]
    fn test_spec_on_raw_table_is_not_pending() {
        let (reports, errors) = check(r#"@Spec(parent, irreflexive: "¬ parent x x");"#);
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].predicate, "parent");
        assert_eq!(reports[0].status, SpecStatus::Unproven);
    }

    #[test]
    fn test_spec_on_functor_made_predicate_is_not_pending() {
        let (reports, errors) = check(
            r#"
            @Spec(Managers, transitive: "A");
            Closure(x:, y:) :- Edge(x:, y:);
            Reports(x:, y:) :- reports(x:, y:);
            Managers := Closure(Edge: Reports);
        "#,
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].status, SpecStatus::Unproven);
    }

    #[test]
    fn test_specs_travel_with_imported_predicate() {
        let root = std::env::temp_dir().join(format!("synalog_specs_{}", std::process::id()));
        std::fs::create_dir_all(&root).unwrap();
        std::fs::write(
            root.join("family.l"),
            "@Spec(Ancestor, transitive: \"A\");\n\
             Ancestor(x:, y:) :- parent(x:, y:);\n\
             @Proof(Ancestor, transitive: \"aesop\");\n",
        )
        .unwrap();
        let main = "import family.Ancestor;\n\
                    @Spec(Ancestor, grounded: \"B\");\n\
                    Known(x:) :- Ancestor(x:);\n";
        let roots = vec![root.to_string_lossy().to_string()];
        let parsed = parse_file(main, None, &roots);
        std::fs::remove_dir_all(&root).ok();
        let parsed = parsed.unwrap();
        let rules: Vec<&Json> = parsed.as_object()["rule"].as_array().iter().collect();
        let (reports, errors) = check_specs(&rules);
        assert!(errors.is_empty(), "{errors:?}");
        let got: Vec<(&str, &str, SpecStatus)> = reports
            .iter()
            .map(|r| (r.predicate.as_str(), r.name.as_str(), r.status))
            .collect();
        assert_eq!(
            got,
            vec![
                ("Family_Ancestor", "grounded", SpecStatus::Unproven),
                ("Family_Ancestor", "transitive", SpecStatus::Unverified),
            ]
        );
    }

    #[test]
    fn test_triple_quoted_text_is_kept_verbatim() {
        let (reports, errors) = check(
            "@Spec(Ancestor, transitive: \"\"\"∀ x y z,\n  Ancestor x y →\n  Ancestor x z\"\"\");",
        );
        assert!(errors.is_empty(), "{errors:?}");
        assert_eq!(reports[0].statement, "∀ x y z,\n  Ancestor x y →\n  Ancestor x z");
    }

    #[test]
    fn test_orphan_proof() {
        let (reports, errors) = check(
            r#"
            Ancestor(x:, y:) :- parent(x:, y:);
            @Proof(Ancestor, transitive: "aesop");
        "#,
        );
        assert!(reports.is_empty());
        assert!(
            matches!(&errors[..], [SpecError::OrphanProof { predicate, name }]
                if predicate == "Ancestor" && name == "transitive"),
            "{errors:?}"
        );
    }

    #[test]
    fn test_proof_does_not_match_spec_of_other_predicate() {
        let (_, errors) = check(
            r#"
            @Spec(Ancestor, transitive: "A");
            @Proof(Descendant, transitive: "aesop");
        "#,
        );
        assert!(matches!(&errors[..], [SpecError::OrphanProof { .. }]), "{errors:?}");
    }

    #[test]
    fn test_duplicate_spec_and_proof() {
        let (reports, errors) = check(
            r#"
            @Spec(Ancestor, transitive: "A");
            @Spec(Ancestor, transitive: "B");
            @Proof(Ancestor, transitive: "aesop");
            @Proof(Ancestor, transitive: "simp");
        "#,
        );
        assert_eq!(reports.len(), 1);
        assert_eq!(reports[0].statement, "A");
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
