// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! Ordering check.
//!
//! A file whose front matter names a predicate (`name: Revenue`) is about
//! that predicate: it is what runs, and what runs is paginated. Without an
//! `@OrderBy` its rows come back in whatever order the engine picks, so the
//! same page differs between runs. The named predicate must be ordered;
//! helpers in the file need not be. Programs without front matter are not
//! checked: nothing says which predicate they are about.

use crate::errors::VerifyError;
use crate::parser::Json;

/// The named predicate has no `@OrderBy`.
#[derive(Debug, Clone)]
pub struct OrderByError {
    pub predicate: String,
}

impl std::fmt::Display for OrderByError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", VerifyError::from(self.clone()))
    }
}

impl From<OrderByError> for VerifyError {
    fn from(e: OrderByError) -> Self {
        VerifyError::MissingOrderBy { predicate: e.predicate }
    }
}

/// The predicate an `@OrderBy` annotation is about: its first argument.
fn ordered_predicate(rule: &Json) -> Option<&str> {
    let head = rule.as_object().get("head")?.as_object();
    if head.get("predicate_name")?.as_str() != "@OrderBy" {
        return None;
    }
    let first = head.get("record")?.as_object().get("field_value")?.as_array().first()?;
    let literal = first.as_object().get("value")?.as_object().get("expression")?.as_object().get("literal")?;
    Some(literal.as_object().get("the_predicate")?.as_object().get("predicate_name")?.as_str())
}

/// `Some(error)` when the program's front matter names a predicate that no
/// `@OrderBy` orders.
pub fn check_order_by(parsed: &Json, rules: &[&Json]) -> Option<OrderByError> {
    let name = parsed.as_object().get("front_matter")?.as_object().get("name")?;
    if !name.is_string() {
        return None;
    }
    let name = name.as_str();
    if rules.iter().any(|r| ordered_predicate(r) == Some(name)) {
        None
    } else {
        Some(OrderByError { predicate: name.to_string() })
    }
}

#[cfg(test)]
mod tests {
    use crate::parser::parse_file;
    use crate::verifier::{validate, CheckError};

    fn order_errors(source: &str) -> Vec<String> {
        let parsed = parse_file(source, None, &[]).expect("parses");
        validate(&parsed)
            .errors
            .iter()
            .filter(|e| matches!(e, CheckError::OrderBy(_)))
            .map(|e| e.to_string())
            .collect()
    }

    #[test]
    fn named_and_ordered_passes_with_unordered_helpers() {
        let src = "---\nname: Total\n---\nA(x:) :- x in Range(3);\n@OrderBy(Total, \"x\");\nTotal(x:) :- A(x:);\n";
        assert!(order_errors(src).is_empty());
    }

    #[test]
    fn named_but_unordered_fails() {
        let src = "---\nname: Total\n---\nTotal(x:) :- x in Range(3);\n";
        let errors = order_errors(src);
        assert_eq!(errors.len(), 1);
        assert!(errors[0].contains("Missing @OrderBy for 'Total'"), "{}", errors[0]);
    }

    #[test]
    fn another_predicate_ordered_does_not_count() {
        let src = "---\nname: Total\n---\n@OrderBy(A, \"x\");\nA(x:) :- x in Range(3);\nTotal(x:) :- A(x:);\n";
        assert_eq!(order_errors(src).len(), 1);
    }

    #[test]
    fn no_front_matter_is_not_checked() {
        assert!(order_errors("Total(x:) :- x in Range(3);\n").is_empty());
    }

    #[test]
    fn a_functor_result_is_ordered_like_a_rule() {
        let src = "---\nname: Big\n---\nSeg(x:) :- x in Range(3);\nSum(n? += x) distinct :- Seg(x:);\nOnly(x:) :- x in Range(2);\n@OrderBy(Big, \"n\");\nBig := Sum(Seg: Only);\n";
        assert!(order_errors(src).is_empty());
    }
}
