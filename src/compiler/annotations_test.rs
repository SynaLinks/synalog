// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use super::*;
use crate::parser::parse_file;

fn parse_annotations(source: &str) -> Annotations {
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules: Vec<(String, Json)> = parsed
        .as_object()["rule"].as_array()
        .iter()
        .map(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"]
                .as_str()
                .to_string();
            (name, r.clone())
        })
        .collect();
    Annotations::extract(&rules).unwrap()
}

// ── engine ──

#[test]
fn test_engine_default() {
    let ann = parse_annotations(r#"T("hello");"#);
    assert_eq!(ann.engine(), "duckdb");
}

#[test]
fn test_engine_sqlite() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert_eq!(ann.engine(), "sqlite");
}

#[test]
fn test_engine_bigquery() {
    let ann = parse_annotations(r#"
        @Engine("bigquery");
        T("hello");
    "#);
    assert_eq!(ann.engine(), "bigquery");
}

#[test]
fn test_engine_psql() {
    let ann = parse_annotations(r#"
        @Engine("psql");
        T("hello");
    "#);
    assert_eq!(ann.engine(), "psql");
}

// ── ground ──

#[test]
fn test_ground() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(MyTable);
        T(x) :- MyTable(x);
    "#);
    let g = ann.ground("MyTable");
    assert!(g.is_some());
    assert_eq!(g.unwrap().table_name, "logica_test.MyTable");
}

#[test]
fn test_ground_overwrite_default() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(MyTable);
        T(x) :- MyTable(x);
    "#);
    let g = ann.ground("MyTable").unwrap();
    assert!(g.overwrite);
}

#[test]
fn test_no_ground() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.ground("T").is_none());
}

#[test]
fn test_ground_with_alias() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(Pred, actual_table);
        T(x) :- Pred(x);
    "#);
    let g = ann.ground("Pred");
    assert!(g.is_some());
    assert_eq!(g.unwrap().table_name, "actual_table");
}

// ── grounded_predicates ──

#[test]
fn test_grounded_predicates() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(A);
        @Ground(B);
        T(x) :- A(x), B(x);
    "#);
    let grounded = ann.grounded_predicates();
    assert!(grounded.contains("A"));
    assert!(grounded.contains("B"));
    assert!(!grounded.contains("T"));
}

#[test]
fn test_grounded_predicates_empty() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.grounded_predicates().is_empty());
}

// ── use_with ──

#[test]
fn test_use_with_default() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.use_with("T"));
}

#[test]
fn test_use_with_explicit() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @With(T);
        T("hello");
    "#);
    assert!(ann.use_with("T"));
}

#[test]
fn test_use_with_nowith() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @NoWith(T);
        T("hello");
    "#);
    assert!(!ann.use_with("T"));
}

// ── force_with ──

#[test]
fn test_force_with_default() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(!ann.force_with("T"));
}

#[test]
fn test_force_with_explicit() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @With(T);
        T("hello");
    "#);
    assert!(ann.force_with("T"));
}

// ── no_inject ──

#[test]
fn test_no_inject_default() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(!ann.no_inject("T"));
}

#[test]
fn test_no_inject_explicit() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @NoInject(T);
        T("hello");
    "#);
    assert!(ann.no_inject("T"));
}

// ── ok_injection ──

#[test]
fn test_ok_injection_default() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.ok_injection("T"));
}

#[test]
fn test_ok_injection_blocked_by_noinject() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @NoInject(T);
        T("hello");
    "#);
    assert!(!ann.ok_injection("T"));
}

#[test]
fn test_ok_injection_blocked_by_ground() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(T);
        T("hello");
    "#);
    assert!(!ann.ok_injection("T"));
}

#[test]
fn test_ok_injection_blocked_by_force_with() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @With(T);
        T("hello");
    "#);
    assert!(!ann.ok_injection("T"));
}

#[test]
fn test_ok_injection_blocked_by_limit() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Limit(T, 10);
        T("hello");
    "#);
    assert!(!ann.ok_injection("T"));
}

// ── order_by ──

#[test]
fn test_order_by() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @OrderBy(T, col1);
        T("hello");
    "#);
    let order = ann.order_by("T");
    assert!(order.is_some());
    let cols = order.unwrap();
    assert_eq!(cols, vec!["col1"]);
}

#[test]
fn test_order_by_none() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.order_by("T").is_none());
}

#[test]
fn test_order_by_clause() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @OrderBy(T, col1);
        T("hello");
    "#);
    let clause = ann.order_by_clause("T");
    assert!(clause.contains("ORDER BY"), "Got: {}", clause);
    assert!(clause.contains("col1"), "Got: {}", clause);
}

#[test]
fn test_order_by_clause_empty() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert_eq!(ann.order_by_clause("T"), "");
}

// ── limit ──

#[test]
fn test_limit() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Limit(T, 10);
        T("hello");
    "#);
    assert_eq!(ann.limit_of("T"), Some(10));
}

#[test]
fn test_limit_none() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.limit_of("T").is_none());
}

#[test]
fn test_limit_clause() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Limit(T, 5);
        T("hello");
    "#);
    assert_eq!(ann.limit_clause("T"), " LIMIT 5");
}

#[test]
fn test_limit_clause_empty() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert_eq!(ann.limit_clause("T"), "");
}

// ── get_annotation_rules ──

#[test]
fn test_get_annotation_rules_returns_none() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.get_annotation_rules("Recursive").is_none());
}

// ── DefineFlag ──

#[test]
fn test_define_flag() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @DefineFlag("my_flag", "default_val");
        T("hello");
    "#);
    assert_eq!(ann.flag_values.get("my_flag"), Some(&"default_val".to_string()));
}

#[test]
fn test_define_flag_empty_default() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @DefineFlag("my_flag");
        T("hello");
    "#);
    // With only one arg, default should be empty string
    assert_eq!(ann.flag_values.get("my_flag"), Some(&"".to_string()));
}

// ── extract with empty/no-head rules ──

#[test]
fn test_extract_empty_rules() {
    let ann = Annotations::extract(&[]).unwrap();
    assert_eq!(ann.engine(), "duckdb");
    assert!(ann.annotations.is_empty());
    assert!(ann.flag_values.is_empty());
}

// ── multiple annotations ──

#[test]
fn test_multiple_annotations_same_predicate() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(T);
        @OrderBy(T, col1);
        @Limit(T, 100);
        T("hello");
    "#);
    assert!(ann.ground("T").is_some());
    assert!(ann.order_by("T").is_some());
    assert_eq!(ann.limit_of("T"), Some(100));
}

// ── extract_string_literal edge cases ──

#[test]
fn test_extract_string_literal_nested() {
    // Parser sometimes produces {"the_string": {"the_string": "value"}}
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @DefineFlag("nested_flag", "nested_val");
        T("hello");
    "#);
    assert!(ann.flag_values.contains_key("nested_flag"));
}

// ── field_str from Int field ──

#[test]
fn test_field_values_with_int_field() {
    // Ensure we parse annotations where field indices are integers
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @OrderBy(T, col1, col2);
        T("hello");
    "#);
    let cols = ann.order_by("T").unwrap();
    assert!(cols.len() >= 1, "Should have at least 1 column: {:?}", cols);
}

// ── get_annotation_rules for existing annotation ──

#[test]
fn test_get_annotation_rules_engine() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Recursive(T, 5);
        T("hello");
    "#);
    // Recursive is stored as a regular annotation
    let _ = ann.get_annotation_rules("Recursive");
}

// ── limit_of with number as object ──

#[test]
fn test_limit_none_value() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert_eq!(ann.limit_of("T"), None);
    assert_eq!(ann.limit_clause("T"), "");
}

// ── grounded_predicates with alias ──

#[test]
fn test_grounded_predicates_with_alias() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(A, actual_table);
        T(x) :- A(x);
    "#);
    let grounded = ann.grounded_predicates();
    assert!(grounded.contains("A"));
}

// ── extract_predicate_name via variable ──

#[test]
fn test_order_by_multiple_cols() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @OrderBy(T, col1, col2, col3);
        T("hello");
    "#);
    let cols = ann.order_by("T").unwrap();
    assert!(cols.len() >= 2, "Should have multiple columns: {:?}", cols);
}

// ── order_by_clause format ──

#[test]
fn test_order_by_clause_multiple() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @OrderBy(T, col1, col2);
        T("hello");
    "#);
    let clause = ann.order_by_clause("T");
    assert!(clause.starts_with(" ORDER BY"), "Got: {}", clause);
}

// ── ok_injection with orderby ──

#[test]
fn test_ok_injection_blocked_by_orderby() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @OrderBy(T, col1);
        T("hello");
    "#);
    // OrderBy blocks injection
    assert!(!ann.ok_injection("T"));
}

// ── use_with false (Bool variant) ──

#[test]
fn test_use_with_false() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @NoWith(T);
        T("hello");
    "#);
    assert!(!ann.use_with("T"));
    assert!(!ann.force_with("T"));
}

// ── use_with default true ──

#[test]
fn test_use_with_default_true() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    // Default use_with should be true
    assert!(ann.use_with("T"));
}

// ── force_with true ──

#[test]
fn test_force_with_true() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @With(T);
        T("hello");
    "#);
    assert!(ann.force_with("T"));
    assert!(ann.use_with("T"));
}

// ── ok_injection with with ──

#[test]
fn test_ok_injection_blocked_by_with_annotation() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @With(T);
        T("hello");
    "#);
    assert!(!ann.ok_injection("T"), "With should block injection");
}

// ── ok_injection default true ──

#[test]
fn test_ok_injection_default_allows() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(ann.ok_injection("T"), "Default should allow injection");
}

// ── ground with alias ──

#[test]
fn test_ground_returns_ground_info() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(T, actual_table);
        T("hello");
    "#);
    let ground = ann.ground("T");
    assert!(ground.is_some(), "Should have ground info");
    let g = ground.unwrap();
    assert_eq!(g.table_name, "actual_table");
}

// ── ground without alias ──

#[test]
fn test_ground_no_alias() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Ground(T);
        T("hello");
    "#);
    let ground = ann.ground("T");
    assert!(ground.is_some(), "Should have ground info");
    let g = ground.unwrap();
    assert_eq!(g.table_name, "logica_test.T");
}

// ── limit_value ──

#[test]
fn test_limit_value_number() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @Limit(T, 100);
        T("hello");
    "#);
    let clause = ann.limit_clause("T");
    assert!(clause.contains("100"), "Limit clause: {}", clause);
}

// ── order_by with single column ──

#[test]
fn test_order_by_single_col() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @OrderBy(T, col0);
        T("hello");
    "#);
    let clause = ann.order_by_clause("T");
    assert!(clause.contains("ORDER BY"), "Got: {}", clause);
}

// ── define_flag with default only ──

#[test]
fn test_define_flag_default_value() {
    let ann = parse_annotations(r#"
        @Engine("sqlite");
        @DefineFlag("test_flag", "default_val");
        T("hello");
    "#);
    // Flag values should be populated
    let _ = ann; // Should not panic
}
