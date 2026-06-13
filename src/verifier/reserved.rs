//! Reserved predicate name check.
//!
//! Every dialect injects a standard library program (`Num`, `Str`, `ArgMin`,
//! ...) into the compiled program, and the runtime provides the `CurrentDate`
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
}

impl std::fmt::Display for ReservedError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "Reserved predicate name '{}': it is a built-in library predicate and cannot be redefined",
            self.predicate
        )
    }
}

impl From<ReservedError> for VerifyError {
    fn from(e: ReservedError) -> Self {
        VerifyError::ReservedPredicateName {
            predicate: e.predicate,
        }
    }
}

/// Names of predicates defined by any dialect's library program, plus the
/// runtime-provided `CurrentDate` built-in concept.
pub fn reserved_predicate_names() -> &'static HashSet<String> {
    static RESERVED: OnceLock<HashSet<String>> = OnceLock::new();
    RESERVED.get_or_init(|| {
        let mut names = HashSet::new();
        names.insert("CurrentDate".to_string());
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
    for rule in rules {
        let name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        if reserved.contains(name) && seen.insert(name.to_string()) {
            errors.push(ReservedError {
                predicate: name.to_string(),
            });
        }
    }
    errors
}
