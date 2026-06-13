// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use crate::parser::parse::parse_file;

#[test]
fn test_dnf_rewrite_simple_conjunction() {
    let program = "A(x) :- B(x), C(x);";
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    // No disjunction, should produce 1 rule
    assert_eq!(rules.len(), 1);
}

#[test]
fn test_dnf_rewrite_simple_disjunction() {
    let program = "A(x) :- B(x) | C(x);";
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    // Should produce 2 rules
    assert_eq!(rules.len(), 2);
}

#[test]
fn test_dnf_rewrite_nested_disjunction() {
    let program = "A(x) :- (B(x) | C(x)), (D(x) | E(x));";
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    // Should produce 4 rules (2 * 2 combinations)
    assert_eq!(rules.len(), 4);
}

#[test]
fn test_dnf_no_body_preserved() {
    let program = "Fact(x: 1);";
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    assert_eq!(rules.len(), 1);
    // Facts without body are preserved as-is
    assert!(!rules[0].as_object().contains_key("body"));
}

#[test]
fn test_multi_body_aggregation_rewrite() {
    let program = r#"
        Count(type:, n? += 1) distinct :- ItemA(type:);
        Count(type:, n? += 1) distinct :- ItemB(type:);
    "#;
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    // Should produce: 2 aux rules + 1 aggregating rule = 3
    assert_eq!(rules.len(), 3);
}

#[test]
fn test_multi_body_aggregation_aux_naming() {
    let program = r#"
        Sum(key:, total? += value) distinct :- A(key:, value:);
        Sum(key:, total? += value) distinct :- B(key:, value:);
    "#;
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    // Check that aux predicates are named with _MultBodyAggAux suffix
    let aux_rules: Vec<_> = rules
        .iter()
        .filter(|r| {
            r.as_object()["head"].as_object()["predicate_name"]
                .as_str()
                .contains("MultBodyAggAux")
        })
        .collect();
    assert_eq!(aux_rules.len(), 2);
}

#[test]
fn test_aggregation_operators_rewritten() {
    let program = "Count(type:, n? += 1) distinct :- Item(type:);";
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    // After rewrite, aggregation operator '+' should become 'Agg+' call
    let json_str = rules[0].to_string_fmt(false);
    assert!(json_str.contains("Agg+"));
}

#[test]
fn test_single_body_aggregation_not_rewritten() {
    let program = "Count(type:, n? += 1) distinct :- Item(type:);";
    let result = parse_file(program, None, &[]).unwrap();
    let rules = result.as_object()["rule"].as_array();
    // Single body aggregation should stay as 1 rule (no aux)
    assert_eq!(rules.len(), 1);
}

#[test]
fn test_mismatched_aggregation_signatures_error() {
    let program = r#"
        Count(type:, n? += 1) distinct :- ItemA(type:);
        Count(type:, n? Max= value) distinct :- ItemB(type:, value:);
    "#;
    let result = parse_file(program, None, &[]);
    // Different aggregation operators across bodies should error
    assert!(result.is_err());
}
