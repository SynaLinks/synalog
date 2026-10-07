// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Functor check.
//!
//! `Big := Revenue(Segment: Large)` replaces `Segment` with `Large` in what
//! `Revenue` depends on. An argument `Revenue` does not depend on would be
//! applied to nothing, and the functor would silently return the generic
//! rule's rows. The compiler refuses it; the verifier runs the same functor
//! expansion, so `check()` reports what `run` would refuse.

use std::collections::HashSet;

use crate::errors::VerifyError;
use crate::parser::Json;

use super::reserved::reserved_predicate_names;

/// A functor the compiler cannot apply, with the compiler's message.
#[derive(Debug, Clone)]
pub struct FunctorError {
    pub message: String,
}

impl std::fmt::Display for FunctorError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", VerifyError::from(self.clone()))
    }
}

impl From<FunctorError> for VerifyError {
    fn from(e: FunctorError) -> Self {
        VerifyError::InvalidFunctor { message: e.message }
    }
}

/// The predicates a `@Make` rule names: its result, the predicate it applies,
/// and the predicates of its arguments.
fn functor_names(rule: &Json) -> Option<(String, String, Vec<String>)> {
    let head = rule.as_object()["head"].as_object();
    let fvs = head.get("record")?.as_object().get("field_value")?.as_array();
    let value = |i: usize| -> Option<&Json> {
        let v = &fvs.get(i)?.as_object()["value"];
        Some(v.as_object().get("expression").unwrap_or(v))
    };
    let predicate = |v: &Json| -> Option<String> {
        let literal = v.as_object().get("literal")?;
        Some(literal.as_object().get("the_predicate")?.as_object().get("predicate_name")?.as_str().to_string())
    };
    let result = predicate(value(0)?)?;
    let applied = predicate(value(1)?)?;
    let arguments = value(2)
        .and_then(|v| v.as_object().get("record"))
        .and_then(|r| r.as_object().get("field_value"))
        .map(|args| {
            args.as_array()
                .iter()
                .filter_map(|arg| {
                    let v = &arg.as_object()["value"];
                    predicate(v.as_object().get("expression").unwrap_or(v))
                })
                .collect()
        })
        .unwrap_or_default();
    Some((result, applied, arguments))
}

/// Every functor of the program that cannot be applied.
pub fn check_functors(rules: &[&Json]) -> Vec<FunctorError> {
    let makes: Vec<&Json> = rules
        .iter()
        .copied()
        .filter(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "@Make")
        .collect();
    if makes.is_empty() {
        return Vec::new();
    }
    let mut defined: HashSet<String> = rules
        .iter()
        .map(|r| r.as_object()["head"].as_object()["predicate_name"].as_str().to_string())
        .filter(|name| !name.starts_with('@'))
        .collect();
    defined.extend(makes.iter().filter_map(|r| functor_names(r)).map(|(result, ..)| result));

    // A predicate the functor names must exist: the expansion would otherwise
    // read a table of that name, which the database does not have.
    let mut errors = Vec::new();
    for rule in &makes {
        let Some((result, applied, arguments)) = functor_names(rule) else { continue };
        for name in std::iter::once(&applied).chain(arguments.iter()) {
            // A lowercase name is a database table.
            let is_predicate = name.chars().next().is_some_and(|c| c.is_ascii_uppercase());
            if is_predicate && !defined.contains(name) && !reserved_predicate_names().contains(name) {
                errors.push(FunctorError {
                    message: format!("Functor {} names '{}', which the program does not define.", result, name),
                });
            }
        }
    }
    if !errors.is_empty() {
        return errors;
    }

    let owned: Vec<Json> = rules.iter().map(|r| (*r).clone()).collect();
    // Recursion is unfolded first, as the compiler does; a recursion error is
    // the recursion check's to report.
    let Ok(unfolded) = crate::compiler::functors::unfold_recursion(&owned, "duckdb") else {
        return Vec::new();
    };
    crate::compiler::functors::run_makes_with_deps(&unfolded)
        .err()
        .map(|e| FunctorError { message: e.message })
        .into_iter()
        .collect()
}

#[cfg(test)]
mod tests {
    use crate::parser::parse_file;
    use crate::verifier::{validate, CheckError};

    fn functor_errors(source: &str) -> Vec<String> {
        let parsed = parse_file(source, None, &[]).expect("parses");
        validate(&parsed)
            .errors
            .iter()
            .filter(|e| matches!(e, CheckError::Functor(_)))
            .map(|e| e.to_string())
            .collect()
    }

    const BASE: &str = "All(c:) :- c in [1, 2, 3];\nOdd(c:) :- c in [1, 3];\nCount(n? += 1) distinct :- All(c:);\n";

    #[test]
    fn an_argument_the_rule_depends_on_passes() {
        assert!(functor_errors(&format!("{BASE}OddCount := Count(All: Odd);\n")).is_empty());
    }

    #[test]
    fn an_argument_it_does_not_depend_on_fails() {
        let errors = functor_errors(&format!("{BASE}OddCount := Count(Nope: Odd);\n"));
        assert_eq!(errors.len(), 1);
        assert!(errors[0].contains("Functor Count is applied to Nope, which it does not depend on"), "{}", errors[0]);
    }

    #[test]
    fn an_undefined_argument_fails() {
        let errors = functor_errors(&format!("{BASE}Fewer := Count(All: Nope);\n"));
        assert_eq!(errors, vec!["Functor Fewer names 'Nope', which the program does not define.".to_string()]);
    }

    #[test]
    fn no_functor_is_not_checked() {
        assert!(functor_errors(BASE).is_empty());
    }
}
