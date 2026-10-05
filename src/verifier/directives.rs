// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Directive check.
//!
//! `@OrderBy`, `@Limit`, `@Recursive` and `@Ground` are about a predicate of
//! the program. A directive naming a predicate that does not exist, or a column
//! the predicate does not have, would be silently ignored or fail on the
//! database; an `@OrderBy` item that is not a column would be raw SQL.

use std::collections::HashSet;

use crate::assertion;
use crate::compiler::annotations::{limit_number, order_by_item_error};
use crate::errors::VerifyError;
use crate::parser::Json;

use super::assertions::{made_predicate, predicate_name, string_literal};
use super::reserved::reserved_predicate_names;

/// Directives about a predicate, checked here.
const DIRECTIVES: &[&str] = &["@OrderBy", "@Limit", "@Recursive", "@Ground"];

/// A directive that cannot apply.
#[derive(Debug, Clone)]
pub struct DirectiveError {
    pub message: String,
}

impl std::fmt::Display for DirectiveError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", VerifyError::from(self.clone()))
    }
}

impl From<DirectiveError> for VerifyError {
    fn from(e: DirectiveError) -> Self {
        VerifyError::InvalidDirective { message: e.message }
    }
}

/// The arguments of an annotation rule, in order.
fn arguments(rule: &Json) -> Vec<&Json> {
    let head = rule.as_object()["head"].as_object();
    head.get("record")
        .and_then(|r| r.as_object().get("field_value"))
        .map(|fvs| {
            fvs.as_array()
                .iter()
                .map(|fv| {
                    let value = &fv.as_object()["value"];
                    value.as_object().get("expression").unwrap_or(value)
                })
                .collect()
        })
        .unwrap_or_default()
}

/// True if `depth` is a number of steps (1 or more) or -1 (until nothing
/// changes), as `@Recursive` takes.
fn is_recursion_depth(depth: &Json) -> bool {
    if limit_number(depth).is_some_and(|n| n >= 1) {
        return true;
    }
    // -1 parses as the negation of 1.
    let text = source_text(depth);
    text.replace(char::is_whitespace, "") == "-1"
}

/// The source text of an expression, as the parser kept it.
fn source_text(expr: &Json) -> String {
    expr.as_object()
        .get("expression_heritage")
        .map(|h| h.as_str().to_string())
        .unwrap_or_default()
}

/// Every directive of the program that cannot apply.
pub fn check_directives(rules: &[&Json]) -> Vec<DirectiveError> {
    let mut defined: HashSet<String> = HashSet::new();
    for rule in rules {
        let name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        match name {
            "@Make" => defined.extend(made_predicate(rule)),
            n if !n.starts_with('@') => {
                defined.insert(n.to_string());
            }
            _ => {}
        }
    }
    let schema = assertion::schema(rules);
    let mut errors = Vec::new();
    for rule in rules {
        let directive = rule.as_object()["head"].as_object()["predicate_name"].as_str();
        // @Dataset is written into the SQL as a schema: a name, never text.
        if directive == "@Dataset" {
            let args = arguments(rule);
            let name = args.first().map(|a| {
                let o = a.as_object();
                o.get("literal")
                    .and_then(|l| l.as_object().get("the_string"))
                    .map(|t| if t.is_object() { t.as_object()["the_string"].as_str().to_string() } else { t.as_str().to_string() })
                    .unwrap_or_else(|| source_text(a))
            });
            if let Some(name) = name.filter(|n| !crate::compiler::annotations::is_schema_name(n)) {
                errors.push(DirectiveError {
                    message: format!(
                        "@Dataset: '{}' is not a schema name: write names of letters, digits, '_' and '-', joined by '.'",
                        name
                    ),
                });
            }
            continue;
        }
        if !DIRECTIVES.contains(&directive) {
            continue;
        }
        let args = arguments(rule);
        let Some(target) = args.first().and_then(|a| predicate_name(a)) else {
            errors.push(DirectiveError {
                message: format!("{} needs the predicate it is about as its first argument", directive),
            });
            continue;
        };
        if !defined.contains(&target) && !reserved_predicate_names().contains(&target) {
            errors.push(DirectiveError {
                message: format!("{}({}) is about '{}', which the program does not define", directive, target, target),
            });
            continue;
        }
        match directive {
            "@OrderBy" => {
                for arg in &args[1..] {
                    let Some(item) = predicate_name(arg).or_else(|| string_literal(arg)) else {
                        errors.push(DirectiveError {
                            message: format!("@OrderBy({}): each argument is a column name, as a string", target),
                        });
                        continue;
                    };
                    if let Some(problem) = order_by_item_error(&item) {
                        errors.push(DirectiveError { message: format!("@OrderBy({}): {}", target, problem) });
                        continue;
                    }
                    let column = item.split_whitespace().next().unwrap_or_default();
                    let is_direction = column.eq_ignore_ascii_case("ASC") || column.eq_ignore_ascii_case("DESC");
                    if let Some(columns) = schema.get(&target) {
                        if !is_direction && !columns.iter().any(|c| c == column) {
                            errors.push(DirectiveError {
                                message: format!(
                                    "@OrderBy({}): '{}' has no column '{}' (its columns: {})",
                                    target,
                                    target,
                                    column,
                                    columns.join(", ")
                                ),
                            });
                        }
                    }
                }
            }
            "@Limit" => {
                if args.get(1).and_then(|a| limit_number(a)).is_none_or(|n| n < 0) {
                    errors.push(DirectiveError {
                        message: format!("@Limit({}): the limit must be a whole number of rows, 0 or more", target),
                    });
                }
            }
            "@Recursive" => {
                // The depth is optional; given, it is a number of steps, or -1:
                // until nothing changes. Nothing else configures a recursion.
                if args.len() > 2 {
                    errors.push(DirectiveError {
                        message: format!(
                            "@Recursive({}): takes the predicate and its depth only",
                            target
                        ),
                    });
                } else if let Some(depth) = args.get(1) {
                    if !is_recursion_depth(depth) {
                        errors.push(DirectiveError {
                            message: format!(
                                "@Recursive({}): the depth is a whole number of steps, 1 or more, \
                                 or -1 to recurse until nothing changes",
                                target
                            ),
                        });
                    }
                }
            }
            _ => {}
        }
    }
    errors
}

#[cfg(test)]
mod tests {
    use crate::parser::parse_file;
    use crate::verifier::{validate, CheckError};

    fn directive_errors(source: &str) -> Vec<String> {
        let parsed = parse_file(source, None, &[]).expect("parses");
        validate(&parsed)
            .errors
            .iter()
            .filter(|e| matches!(e, CheckError::Directive(_)))
            .map(|e| e.to_string())
            .collect()
    }

    #[test]
    fn valid_directives_pass() {
        let source = "@OrderBy(V, \"x\", \"y DESC\", \"x desc nulls last\");\n@Limit(V, 3);\nV(x:, y:) :- x in [1], y in [2];\n";
        assert!(directive_errors(source).is_empty(), "{:?}", directive_errors(source));
    }

    #[test]
    fn recursive_takes_a_depth_only() {
        let errors = directive_errors(
            "@Recursive(R, 3, iterative: true);\nE(a: 1, b: 2);\nR(x:) distinct :- E(a: x);\nR(x: b) distinct :- R(x: a), E(a:, b:);\n",
        );
        assert_eq!(errors, vec!["@Recursive(R): takes the predicate and its depth only".to_string()]);
    }

    #[test]
    fn raw_sql_in_order_by_is_refused() {
        let errors = directive_errors("@OrderBy(V, \"x; DROP TABLE t\");\nV(x:) :- x in [1];\n");
        assert_eq!(errors.len(), 1);
        assert!(errors[0].contains("is not a column to order by"), "{}", errors[0]);
    }

    #[test]
    fn unknown_column_is_refused() {
        let errors = directive_errors("@OrderBy(V, \"nope\");\nV(x:) :- x in [1];\n");
        assert_eq!(errors, vec!["@OrderBy(V): 'V' has no column 'nope' (its columns: x)".to_string()]);
    }

    #[test]
    fn undefined_predicate_is_refused() {
        let errors = directive_errors("@Limit(Nope, 2);\nV(x:) :- x in [1];\n");
        assert_eq!(errors, vec!["@Limit(Nope) is about 'Nope', which the program does not define".to_string()]);
    }

    #[test]
    fn recursion_until_convergence_is_accepted() {
        let source = "@Recursive(R, -1);\nE(a: 1, b: 2);\nR(x:) distinct :- E(a: x);\nR(x: b) distinct :- R(x: a), E(a:, b:);\n";
        assert!(directive_errors(source).is_empty(), "{:?}", directive_errors(source));
    }

    #[test]
    fn recursion_depth_zero_is_refused() {
        let source = "@Recursive(R, 0);\nE(a: 1, b: 2);\nR(x:) distinct :- E(a: x);\nR(x: b) distinct :- R(x: a), E(a:, b:);\n";
        let errors = directive_errors(source);
        assert_eq!(errors.len(), 1, "{:?}", errors);
        assert!(errors[0].contains("or -1 to recurse until nothing changes"), "{}", errors[0]);
    }

    #[test]
    fn limit_must_be_a_number() {
        let errors = directive_errors("@Limit(V, \"two\");\nV(x:) :- x in [1];\n");
        assert_eq!(errors.len(), 1);
        assert!(errors[0].contains("whole number"), "{}", errors[0]);
    }
}
