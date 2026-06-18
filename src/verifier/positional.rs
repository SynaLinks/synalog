// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Positional-argument check.
//!
//! Synalog uses *named* arguments only: `Predicate(column: value)`. Positional
//! arguments (`Predicate(value1, value2)`) compile to synthetic `col0`, `col1`,
//! … column names that don't match real database schemas, so they're rejected
//! here. Only references that actually become schema-matched SQL columns — plain
//! relational rule heads and body predicate references — are checked. In the
//! parsed AST a named field carries a string `field`, a positional one carries
//! an integer index, so a non-string `field` is the tell.
//!
//! Several constructs legitimately use positional arguments and are exempt:
//!   * Annotations (`@OrderBy(P, "c")`) and function calls (`Substr(s, 1, 2)`,
//!     which live under a `call` key rather than `predicate`).
//!   * Built-in predicates whose name is a known function/operator. Crucially,
//!     desugaring synthesizes some of these as `predicate` references over the
//!     *desugared* AST this check runs on — e.g. negation `~P(x:)` lowers to
//!     `IsNull(Combine= ...)` and `Constraint(...)` carries a positional field —
//!     none of which the user wrote positionally.
//!   * Value / function / aggregation predicates, marked by a `logica_value`
//!     field in the head (`F(x) = ...`, `Cost(d) Min= ...`). Their leading
//!     positional arguments are function parameters or aggregation keys resolved
//!     by the compiler, not schema columns — so both their heads and references
//!     to them are exempt.

use std::collections::HashSet;
use std::sync::OnceLock;

use crate::compiler::dialects;
use crate::compiler::expr_translate::ExprTranslator;
use crate::errors::VerifyError;
use crate::parser::Json;

/// Names of built-in functions/operators across all supported dialects.
///
/// Built-ins take positional arguments by design; some are synthesized as
/// `predicate` references by desugaring (`IsNull` from negation, `Constraint`,
/// …), so positional usage of any of these names is legitimate. Unioned over
/// every dialect (like the reserved-name check) so a dialect-specific built-in
/// is never mistaken for a user predicate.
fn builtin_predicate_names() -> &'static HashSet<String> {
    static BUILTINS: OnceLock<HashSet<String>> = OnceLock::new();
    BUILTINS.get_or_init(|| {
        let mut names = HashSet::new();
        for engine in dialects::SUPPORTED_ENGINES {
            if let Ok(dialect) = dialects::get(engine) {
                names.extend(ExprTranslator::basis_functions(dialect.as_ref()));
            }
        }
        names
    })
}

/// True if a head `record` declares a `logica_value` field — the mark of a
/// value / function / aggregation predicate (`F(x) = ...`, `Cost(d) Min= ...`).
/// Such a predicate's leading positional arguments are function parameters or
/// aggregation keys, not schema-matched columns.
fn record_defines_value(record: &Json) -> bool {
    record
        .as_object()
        .get("field_value")
        .map(|fvs| {
            fvs.as_array().iter().any(|fv| {
                matches!(fv.as_object().get("field"), Some(f) if f.is_string() && f.as_str() == "logica_value")
            })
        })
        .unwrap_or(false)
}

/// Positional-argument usage error (one per offending predicate name).
#[derive(Debug, Clone)]
pub struct PositionalError {
    pub predicate: String,
}

impl std::fmt::Display for PositionalError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "Positional arguments in '{}': Synalog requires named arguments — use `field_name: value` instead of positional arguments",
            self.predicate
        )
    }
}

impl From<PositionalError> for VerifyError {
    fn from(e: PositionalError) -> Self {
        VerifyError::PositionalArguments {
            predicate: e.predicate,
        }
    }
}

/// True if a `record` node holds any positional field (a non-string `field`).
fn record_has_positional(record: &Json) -> bool {
    record
        .as_object()
        .get("field_value")
        .map(|fvs| {
            fvs.as_array().iter().any(|fv| {
                matches!(fv.as_object().get("field"), Some(field) if !field.is_string())
            })
        })
        .unwrap_or(false)
}

/// Collect names of body predicate references (`{"predicate": {...}}`) that use
/// positional arguments, anywhere in `node`. Function calls live under the
/// `"call"` key instead, so they're naturally left alone. References to
/// built-in predicates and to value/function predicates (`value_preds`) are
/// skipped: their positional arguments are not schema-matched columns.
fn collect_body_positional(node: &Json, value_preds: &HashSet<String>, out: &mut Vec<String>) {
    match node {
        Json::Object(obj) => {
            if let Some(pred) = obj.get("predicate") {
                let p = pred.as_object();
                if let Some(record) = p.get("record") {
                    if record_has_positional(record) {
                        let name = p["predicate_name"].as_str();
                        if !builtin_predicate_names().contains(name)
                            && !value_preds.contains(name)
                        {
                            out.push(name.to_string());
                        }
                    }
                }
            }
            for v in obj.values() {
                collect_body_positional(v, value_preds, out);
            }
        }
        Json::Array(items) => {
            for it in items {
                collect_body_positional(it, value_preds, out);
            }
        }
        _ => {}
    }
}

/// Flag rule heads and body predicate references that use positional arguments
/// (one error per predicate name, mirroring the other name-based checks).
pub fn check_positional(rules: &[&Json]) -> Vec<PositionalError> {
    // Value/function/aggregation predicates (heads with a `logica_value` field):
    // their positional arguments are parameters/keys, not schema columns, so
    // both their heads and references to them are exempt.
    let value_preds: HashSet<String> = rules
        .iter()
        .filter(|rule| {
            rule.as_object()["head"]
                .as_object()
                .get("record")
                .map(record_defines_value)
                .unwrap_or(false)
        })
        .map(|rule| {
            rule.as_object()["head"].as_object()["predicate_name"]
                .as_str()
                .to_string()
        })
        .collect();

    let mut seen = HashSet::new();
    let mut errors = Vec::new();
    for rule in rules {
        let obj = rule.as_object();
        let head = &obj["head"];

        // Annotations (`@OrderBy`, `@Limit`, …) take positional arguments by
        // design — skip them.
        if head.as_object()["predicate_name"]
            .as_str()
            .starts_with('@')
        {
            continue;
        }

        // Head: a plain relational predicate's column list must be named. Value
        // / function predicates (`logica_value` in the head) are exempt.
        if let Some(record) = head.as_object().get("record") {
            if record_has_positional(record) && !record_defines_value(record) {
                let name = head.as_object()["predicate_name"].as_str().to_string();
                if seen.insert(name.clone()) {
                    errors.push(PositionalError { predicate: name });
                }
            }
        }

        // Body predicate references.
        if let Some(body) = obj.get("body") {
            let mut names = Vec::new();
            collect_body_positional(body, &value_preds, &mut names);
            for name in names {
                if seen.insert(name.clone()) {
                    errors.push(PositionalError { predicate: name });
                }
            }
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
    fn flags_positional_head() {
        let r = rules("Customer(id, name) :- customers(id:, name:);");
        let errs = check_positional(&r);
        assert_eq!(errs.len(), 1);
        assert_eq!(errs[0].predicate, "Customer");
    }

    #[test]
    fn flags_positional_body_reference() {
        let r = rules("Foo(x:) :- bar(x, y);");
        let errs = check_positional(&r);
        assert_eq!(errs.len(), 1);
        assert_eq!(errs[0].predicate, "bar");
    }

    #[test]
    fn named_program_is_clean() {
        let r = rules("Customer(id:, name:) :- customers(id:, name:);");
        assert!(check_positional(&r).is_empty());
    }

    #[test]
    fn function_calls_are_not_flagged() {
        // Substr / ToString are positional function calls — legitimate.
        let r = rules("Foo(y:) :- bar(s:), y == Substr(ToString(s), 1, 2);");
        assert!(check_positional(&r).is_empty());
    }

    #[test]
    fn annotations_are_not_flagged() {
        // @OrderBy uses positional arguments by design.
        let r = rules("@OrderBy(Foo, \"x\");\nFoo(x:) :- bar(x:);");
        assert!(check_positional(&r).is_empty());
    }

    #[test]
    fn one_error_per_predicate_name() {
        let r = rules(
            "Foo(a, b) :- bar(a:, b:);\n\
             Foo(a, b) :- baz(a:, b:);",
        );
        assert_eq!(check_positional(&r).len(), 1);
    }

    #[test]
    fn negation_is_not_flagged() {
        // `~L(id:)` desugars to a synthetic `IsNull(Combine= ...)` predicate
        // reference with a positional field — the user wrote named args.
        let r = rules("Foo(id:) :- C(id:), ~L(id:);");
        assert!(check_positional(&r).is_empty());
    }

    #[test]
    fn constraint_is_not_flagged() {
        // `Constraint(...)` is a built-in carrying a positional field.
        let r = rules("Foo(id:) :- C(id:), Constraint(id > 0);");
        assert!(check_positional(&r).is_empty());
    }

    #[test]
    fn udf_definition_head_is_not_flagged() {
        // `Square(x) = x * x` is a function definition; its positional param is
        // legitimate and naming it would break the call site.
        let r = rules("Square(x) = x * x;\nFoo(n:) :- C(n:), m == Square(n);");
        assert!(check_positional(&r).is_empty());
    }

    #[test]
    fn value_predicate_head_and_reference_are_not_flagged() {
        // SSSP-style value predicate: positional key in both the head and the
        // recursive body reference.
        let r = rules(
            "Cost(\"w\") = 0;\n\
             Cost(d) Min= c :- R(o: \"w\", d:, c:);\n\
             Cost(d) Min= Cost(h) + c :- Cost(h), R(o: h, d:, c:);",
        );
        assert!(check_positional(&r).is_empty());
    }
}
