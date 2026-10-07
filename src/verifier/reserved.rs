// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Reserved predicate name check.
//!
//! Every dialect injects a standard library program (`Num`, `Str`, `ArgMin`,
//! ...) into the compiled program, and the compiler inlines the `Today`/`Now`
//! concept. A user rule that redefines one of these names collides with the
//! library definition and fails at compile time with an unrelated-looking
//! error ("Undefined variable: x_0"), so catch it here with a clear message.

use std::collections::HashSet;
use std::sync::OnceLock;

use crate::errors::VerifyError;
use crate::parser::Json;

/// Reserved predicate name error.
#[derive(Debug, Clone)]
pub struct ReservedError {
    pub predicate: String,
    /// The name is a built-in function's (`Upper`, `Pow`), not a library
    /// predicate's.
    pub function: bool,
}

impl std::fmt::Display for ReservedError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", VerifyError::from(self.clone()))
    }
}

impl From<ReservedError> for VerifyError {
    fn from(e: ReservedError) -> Self {
        VerifyError::ReservedPredicateName {
            predicate: e.predicate,
            function: e.function,
        }
    }
}

/// Names of predicates defined by any dialect's library program, plus the
/// compiler-inlined `Today` / `Now` built-in concepts.
pub fn reserved_predicate_names() -> &'static HashSet<String> {
    static RESERVED: OnceLock<HashSet<String>> = OnceLock::new();
    RESERVED.get_or_init(|| {
        let mut names = HashSet::new();
        // Built-in temporal concepts, inlined per-dialect by the compiler.
        names.insert("Today".to_string());
        names.insert("Now".to_string());
        for engine in crate::compiler::dialects::SUPPORTED_ENGINES {
            let Ok(dialect) = crate::compiler::dialects::get(engine) else {
                continue;
            };
            let Ok(parsed) = crate::parser::parse_file(dialect.library_program(), None, &[])
            else {
                continue;
            };
            for rule in parsed.as_object()["rule"].as_array() {
                names.insert(
                    rule.as_object()["head"].as_object()["predicate_name"]
                        .as_str()
                        .to_string(),
                );
            }
        }
        names
    })
}

/// Flag rules that define a reserved predicate name (one error per name).
pub fn check_reserved(rules: &[&Json]) -> Vec<ReservedError> {
    let reserved = reserved_predicate_names();
    let mut seen = HashSet::new();
    let mut errors = Vec::new();
    // A function named like a built-in one would be typed as the built-in
    // (`Pow(x) = {sq: x * x}` "cannot match number with {sq: number}"),
    // and change what the name means for the whole program. A relation of
    // that name (`Rank(x:)`) is never called as a function: it stays free.
    let functions = super::undefined::builtin_function_names();
    for rule in rules {
        let head = rule.as_object()["head"].as_object();
        let name = head["predicate_name"].as_str();
        let defines_a_value = head.get("record")
            .and_then(|r| r.as_object().get("field_value"))
            .is_some_and(|fvs| fvs.as_array().iter().any(|fv| {
                let f = &fv.as_object()["field"];
                f.is_string() && f.as_str() == "logica_value"
            }));
        let function = !reserved.contains(name)
            && defines_a_value
            && functions.contains(name)
            && name.chars().next().is_some_and(|c| c.is_ascii_uppercase());
        if (reserved.contains(name) || function) && seen.insert(name.to_string()) {
            errors.push(ReservedError {
                predicate: name.to_string(),
                function,
            });
        }
    }
    errors
}
