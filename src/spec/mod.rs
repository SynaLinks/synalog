// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! The language of `@Spec` statements.
//!
//! A statement is a first-order formula over the program's predicates, in the
//! syntax of a Lean proposition ([`parse`]). It is checked against a database
//! by compiling the search for its counterexamples to SQL like any other
//! predicate ([`translate`]).

pub mod parse;
pub mod translate;

pub use parse::{parse, Expr, SyntaxError};
pub use translate::{translate, Schema, TranslateError, Translation};

use crate::parser::Json;

/// Columns of every predicate the program defines, in the order its first
/// rule declares them. Predicates with positional columns are left out.
pub fn schema(rules: &[&Json]) -> Schema {
    let mut schema = Schema::new();
    for rule in rules {
        let head = rule.as_object()["head"].as_object();
        let name = head["predicate_name"].as_str();
        if name.starts_with('@') || schema.contains_key(name) {
            continue;
        }
        let field_values = head
            .get("record")
            .and_then(|r| r.as_object().get("field_value"))
            .map(|fvs| fvs.as_array().as_slice())
            .unwrap_or_default();
        let mut columns = Vec::new();
        let mut named = true;
        for fv in field_values {
            let field = &fv.as_object()["field"];
            if field.is_string() {
                columns.push(field.as_str().to_string());
            } else {
                named = false;
            }
        }
        if named {
            schema.insert(name.to_string(), columns);
        }
    }
    schema
}

/// Name of the predicate holding the counterexamples of a spec.
pub fn check_predicate(predicate: &str, name: &str) -> String {
    format!("Spec_{}_{}", predicate, name)
}
