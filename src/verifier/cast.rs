// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Unsafe `Cast`/`TryCast` type names.
//!
//! `Cast(expr, "TYPE")` and `TryCast(expr, "TYPE")` paste `TYPE` into the SQL
//! unquoted, as `CAST(expr AS TYPE)`. So a type that is not a plain type name
//! would reach the query as SQL: `Cast(1, "TEXT) AS x; DROP TABLE t; --")`
//! compiles to a second statement. A type name is accepted only when it is a
//! string literal of type characters with balanced brackets
//! (`synalog_verified::cast::accepts`, proved to hold nothing that could end
//! the `CAST(...)` or start anything after it); anything else is rejected
//! here, and the compiler rejects it again (`expr_translate`).

use std::collections::HashSet;

use crate::errors::VerifyError;
use crate::parser::Json;

/// A `Cast`/`TryCast` whose type name is not a plain type name.
#[derive(Debug, Clone)]
pub struct CastError {
    pub predicate: String,
    pub type_name: String,
}

impl std::fmt::Display for CastError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", VerifyError::from(self.clone()))
    }
}

impl From<CastError> for VerifyError {
    fn from(e: CastError) -> Self {
        VerifyError::UnsafeCastType { predicate: e.predicate, type_name: e.type_name }
    }
}

/// The type name a `Cast`/`TryCast` call names, when it is not accepted: its
/// text, or the empty string when the type argument is not a string literal.
/// `None` when the call is not a `Cast`/`TryCast` or its type is accepted.
fn unsafe_cast_type(node: &Json) -> Option<String> {
    let obj = node.as_object();
    let call = obj.get("call")?.as_object();
    let name = call.get("predicate_name")?;
    if !name.is_string() || (name.as_str() != "Cast" && name.as_str() != "TryCast") {
        return None;
    }
    let fvs = call.get("record")?.as_object().get("field_value")?.as_array();
    // The second positional argument (field 1) is the type.
    let type_arg = fvs.iter().find(|fv| {
        let f = &fv.as_object()["field"];
        f.is_int() && f.as_int() == 1
    })?;
    let expr = type_arg.as_object().get("value")?.as_object().get("expression")?;
    let literal = expr.as_object().get("literal").map(|l| l.as_object());
    let the_string = literal.and_then(|l| l.get("the_string"));
    let text = match the_string {
        // {"the_string": {"the_string": "..."}}
        Some(s) if s.is_object() => s.as_object().get("the_string").map(|v| v.as_str()),
        Some(s) if s.is_string() => Some(s.as_str()),
        _ => None,
    };
    match text {
        Some(t) if synalog_verified::cast::accepts(&t.chars().collect()) => None,
        Some(t) => Some(t.to_string()),
        // Not a string literal (`Cast(1, Upper("text"))`): the type must be one.
        None => Some(String::new()),
    }
}

fn find_unsafe(node: &Json, out: &mut Vec<String>) {
    match node {
        Json::Object(obj) => {
            if let Some(t) = unsafe_cast_type(node) {
                out.push(t);
            }
            for v in obj.values() {
                find_unsafe(v, out);
            }
        }
        Json::Array(items) => items.iter().for_each(|v| find_unsafe(v, out)),
        _ => {}
    }
}

/// Flag every rule with a `Cast`/`TryCast` whose type name is not accepted
/// (one error per predicate name, as the reserved-name check does).
pub fn check_cast(rules: &[&Json]) -> Vec<CastError> {
    let mut seen = HashSet::new();
    let mut errors = Vec::new();
    for rule in rules {
        let mut found = Vec::new();
        find_unsafe(rule, &mut found);
        if found.is_empty() {
            continue;
        }
        let name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        if seen.insert(name.to_string()) {
            errors.push(CastError {
                predicate: name.to_string(),
                type_name: found.into_iter().next().unwrap(),
            });
        }
    }
    errors
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::parser::parse_file;

    fn rules(code: &str) -> Vec<&'static Json> {
        let parsed: &'static Json = Box::leak(Box::new(parse_file(code, None, &[]).unwrap()));
        parsed.as_object()["rule"].as_array().iter().collect()
    }

    #[test]
    fn plain_type_is_allowed() {
        assert!(check_cast(&rules(r#"Q(x:) :- x == Cast(1, "TEXT");"#)).is_empty());
        assert!(check_cast(&rules(r#"Q(x:) :- x == Cast(1, "DECIMAL(38, 2)");"#)).is_empty());
        assert!(check_cast(&rules(r#"Q(x:) :- x == TryCast(1, "ARRAY<INT64>");"#)).is_empty());
    }

    #[test]
    fn statement_injection_is_refused() {
        let errs = check_cast(&rules(r#"Q(x:) :- x == Cast(1, "TEXT) AS x; DROP TABLE t; --");"#));
        assert_eq!(errs.len(), 1);
        assert_eq!(errs[0].predicate, "Q");
    }

    #[test]
    fn unbalanced_bracket_is_refused() {
        assert_eq!(check_cast(&rules(r#"Q(x:) :- x == Cast(1, "INT)");"#)).len(), 1);
    }

    #[test]
    fn non_literal_type_is_refused() {
        assert_eq!(check_cast(&rules(r#"Q(x:) :- x == Cast(1, Upper("text"));"#)).len(), 1);
    }

    #[test]
    fn clean_program_has_no_error() {
        assert!(check_cast(&rules("Q(x:) :- R(x:), x > 0;")).is_empty());
    }
}
