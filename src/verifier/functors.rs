// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Functor check.
//!
//! `Big := Revenue(Segment: Large)` replaces `Segment` with `Large` in what
//! `Revenue` depends on. An argument `Revenue` does not depend on would be
//! applied to nothing, and the functor would silently return the generic
//! rule's rows. The compiler refuses it; the verifier runs the same functor
//! expansion, so `check()` reports what `run` would refuse.

use crate::errors::VerifyError;
use crate::parser::Json;

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

/// `Some(error)` when a functor of the program cannot be applied.
pub fn check_functors(rules: &[&Json]) -> Option<FunctorError> {
    let has_functor = rules
        .iter()
        .any(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "@Make");
    if !has_functor {
        return None;
    }
    let owned: Vec<Json> = rules.iter().map(|r| (*r).clone()).collect();
    // Recursion is unfolded first, as the compiler does; a recursion error is
    // the recursion check's to report.
    let unfolded = crate::compiler::functors::unfold_recursion(&owned, "duckdb").ok()?;
    crate::compiler::functors::run_makes_with_deps(&unfolded)
        .err()
        .map(|e| FunctorError { message: e.message })
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
    fn no_functor_is_not_checked() {
        assert!(functor_errors(BASE).is_empty());
    }
}
