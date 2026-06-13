// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Unsafe `SqlExpr` check.
//!
//! `SqlExpr("...", {...})` injects a raw SQL string directly into the compiled
//! query, bypassing parsing, type-checking, verification, and cross-engine
//! portability. The dialect standard library uses it deliberately (ArgMin,
//! ArgMax, RMatch, ...), but those definitions are *injected* during
//! compilation and never reach this check — `validate` only sees the parsed
//! user program. So any `SqlExpr` found here is user-written and rejected:
//! the safe path is to express the logic in Synalog (for temporal math, the
//! `Substr` → `ToInt64` → `ToString` pipeline).

use std::collections::HashSet;

use crate::errors::VerifyError;
use crate::parser::Json;

/// Unsafe `SqlExpr` usage error (one per offending rule head).
#[derive(Debug, Clone)]
pub struct SqlExprError {
    pub predicate: String,
}

impl std::fmt::Display for SqlExprError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "Unsafe SqlExpr in rule '{}': raw SQL bypasses verification and portability",
            self.predicate
        )
    }
}

impl From<SqlExprError> for VerifyError {
    fn from(e: SqlExprError) -> Self {
        VerifyError::UnsafeSqlExpr {
            predicate: e.predicate,
        }
    }
}

/// True if `node` (or anything nested inside it) is a call to `SqlExpr`.
fn contains_sql_expr(node: &Json) -> bool {
    match node {
        Json::Object(obj) => {
            if let Some(Json::Object(call)) = obj.get("call") {
                if let Some(name) = call.get("predicate_name") {
                    if name.is_string() && name.as_str() == "SqlExpr" {
                        return true;
                    }
                }
            }
            obj.values().any(contains_sql_expr)
        }
        Json::Array(items) => items.iter().any(contains_sql_expr),
        _ => false,
    }
}

/// Flag every rule whose body reaches for the raw-SQL `SqlExpr` escape hatch
/// (one error per predicate name, mirroring the reserved-name check).
pub fn check_sqlexpr(rules: &[&Json]) -> Vec<SqlExprError> {
    let mut seen = HashSet::new();
    let mut errors = Vec::new();
    for rule in rules {
        if !contains_sql_expr(rule) {
            continue;
        }
        let name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        if seen.insert(name.to_string()) {
            errors.push(SqlExprError {
                predicate: name.to_string(),
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
        // Leak the parse tree so borrowed `&Json` references satisfy the
        // helper signature in tests; fine for short-lived test processes.
        let parsed: &'static Json = Box::leak(Box::new(parse_file(code, None, &[]).unwrap()));
        parsed.as_object()["rule"].as_array().iter().collect()
    }

    #[test]
    fn flags_user_sqlexpr() {
        let r = rules(r#"Foo(x:) :- Now(timestamp: t), x == SqlExpr("{t} - 1", {t:});"#);
        let errs = check_sqlexpr(&r);
        assert_eq!(errs.len(), 1);
        assert_eq!(errs[0].predicate, "Foo");
    }

    #[test]
    fn flags_sqlexpr_nested_in_expression() {
        // Buried inside arithmetic, not at the top of the unification.
        let r = rules(r#"Foo(x:) :- Bar(a:), x == 1 + SqlExpr("{a}", {a:});"#);
        assert_eq!(check_sqlexpr(&r).len(), 1);
    }

    #[test]
    fn clean_program_has_no_error() {
        let r = rules("Foo(x:) :- Bar(x:), x > 0;");
        assert!(check_sqlexpr(&r).is_empty());
    }

    #[test]
    fn one_error_per_predicate_name() {
        // Same predicate defined by two rules, both using SqlExpr -> one error.
        let r = rules(
            r#"Foo(x:) :- A(x:), x == SqlExpr("{x}", {x:});
               Foo(x:) :- B(x:), x == SqlExpr("{x} + 1", {x:});"#,
        );
        assert_eq!(check_sqlexpr(&r).len(), 1);
    }

    #[test]
    fn calling_a_library_function_is_allowed() {
        // ArgMax is a library predicate implemented with SqlExpr, but the user
        // only *calls* it -- the SqlExpr lives in the injected library, which
        // this check never sees. Calling it must not be flagged.
        let r = rules("Top(best:) :- Sales(item:, amt:), best == ArgMax(item -> amt);");
        assert!(check_sqlexpr(&r).is_empty());
    }
}
