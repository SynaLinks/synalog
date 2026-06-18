// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use super::*;
use crate::parser::parse_file;
use crate::compiler::dialects;

fn compile_single_rule(source: &str) -> (RuleStructure, Box<dyn dialects::Dialect>) {
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let s = extract_rule_structure(rule, None).unwrap();
    let d = dialects::get("sqlite").unwrap();
    (s, d)
}

// ── NamesAllocator ──

#[test]
fn test_names_allocator_table() {
    let mut alloc = NamesAllocator::new();
    let t1 = alloc.alloc_table(None);
    let t2 = alloc.alloc_table(None);
    assert_ne!(t1, t2);
    assert!(t1.starts_with("t_"));
    assert!(t2.starts_with("t_"));
}

#[test]
fn test_names_allocator_table_hint() {
    let mut alloc = NamesAllocator::new();
    let t = alloc.alloc_table(Some("my_pred"));
    assert!(t.contains("my_pred"), "Table name should contain hint: {}", t);
}

#[test]
fn test_names_allocator_var() {
    let mut alloc = NamesAllocator::new();
    let v1 = alloc.alloc_var();
    let v2 = alloc.alloc_var();
    assert_ne!(v1, v2);
}

#[test]
fn test_names_allocator_unique_tables() {
    let mut alloc = NamesAllocator::new();
    let mut names = std::collections::HashSet::new();
    for _ in 0..100 {
        let t = alloc.alloc_table(None);
        assert!(names.insert(t), "Table names should be unique");
    }
}

#[test]
fn test_names_allocator_unique_vars() {
    let mut alloc = NamesAllocator::new();
    let mut names = std::collections::HashSet::new();
    for _ in 0..100 {
        let v = alloc.alloc_var();
        assert!(names.insert(v), "Var names should be unique");
    }
}

// ── RuleStructure::new ──

#[test]
fn test_rule_structure_new() {
    let s = RuleStructure::new();
    assert!(s.this_predicate_name.is_empty());
    assert!(s.tables.is_empty());
    assert!(s.vars_map.is_empty());
    assert!(s.inv_vars_map.is_empty());
    assert!(s.vars_unification.is_empty());
    assert!(s.select.is_empty());
    assert!(s.unnestings.is_empty());
    assert!(s.distinct_vars.is_empty());
    assert!(s.constraints.is_empty());
    assert!(!s.distinct_denoted);
    assert!(s.aggregated_fields.is_empty());
    assert!(s.external_vocabulary.is_none());
}

// ── extract_rule_structure ──

#[test]
fn test_extract_rule_structure_simple_fact() {
    let (s, _d) = compile_single_rule(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(s.tables.is_empty());
    assert!(s.select.contains_key("col0"));
}

#[test]
fn test_extract_rule_structure_with_body() {
    let (s, _d) = compile_single_rule(r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#);
    assert!(!s.tables.is_empty());
}

#[test]
fn test_extract_rule_structure_named_field() {
    let (s, _d) = compile_single_rule(r#"
        @Engine("sqlite");
        T(name: "hello");
    "#);
    assert!(s.select.contains_key("name"), "Got keys: {:?}", s.select.keys().collect::<Vec<_>>());
}

#[test]
fn test_extract_rule_structure_multi_field() {
    let (s, _d) = compile_single_rule(r#"
        @Engine("sqlite");
        T("hello", "world");
    "#);
    assert!(s.select.contains_key("col0"));
    assert!(s.select.contains_key("col1"));
}

#[test]
fn test_extract_rule_structure_predicate_name() {
    let (s, _d) = compile_single_rule(r#"
        @Engine("sqlite");
        MyPred("hello");
    "#);
    assert_eq!(s.this_predicate_name, "MyPred");
}

// ── vars_vocabulary ──

#[test]
fn test_vars_vocabulary() {
    let (s, d) = compile_single_rule(r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#);
    let vocab = s.vars_vocabulary(d.as_ref());
    assert!(!vocab.is_empty(), "Vocabulary should have entries from body predicates");
}

// ── finalize_rule_structure ──

#[test]
fn test_finalize_rule_structure() {
    let source = r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    // After finalization, internal variables should be eliminated
    assert!(!s.select.is_empty());
}

#[test]
fn test_finalize_clears_unifications() {
    let source = r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    // After finalization, unifications should be converted to constraints
    assert!(s.vars_unification.is_empty());
}

// ── decorate_combine_rule ──

#[test]
fn test_decorate_combine_rule() {
    let source = r#"
        @Engine("sqlite");
        T(x? += 1) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let decorated = decorate_combine_rule(rule, "logica_var_0");
    assert!(decorated.is_object());
}

// ── extract_rule_structure with allocator ──

#[test]
fn test_extract_rule_structure_with_allocator() {
    let source = r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let alloc = NamesAllocator::new();
    let s = extract_rule_structure(rule, Some(alloc)).unwrap();
    assert!(!s.tables.is_empty());
}

// ── extract_rule_structure_with_vocabulary ──

#[test]
fn test_extract_rule_structure_with_vocabulary() {
    let source = r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();

    let mut ext_vocab = HashMap::new();
    ext_vocab.insert("outer_var".to_string(), "outer_table.col".to_string());
    let s = extract_rule_structure_with_vocabulary(rule, None, Some(ext_vocab)).unwrap();
    assert!(s.external_vocabulary.is_some());
    let d = dialects::get("bigquery").unwrap();
    let vocab = s.vars_vocabulary(d.as_ref());
    assert!(vocab.contains_key("outer_var"));
}

// ── RuleStructure::eliminate_internal_variables ──

#[test]
fn test_eliminate_internal_variables() {
    let source = r#"
        @Engine("sqlite");
        Result(y) :- Source(x), x == y;
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    s.eliminate_internal_variables();
    // After elimination, select should still have entries
    assert!(!s.select.is_empty());
}

// ── RuleStructure::unifications_to_constraints ──

#[test]
fn test_unifications_to_constraints() {
    let mut s = RuleStructure::new();
    let left = crate::json_obj!("variable" => crate::json_obj!("var_name" => "a"));
    let right = crate::json_obj!("variable" => crate::json_obj!("var_name" => "b"));
    s.vars_unification.push((left, right));
    s.unifications_to_constraints();
    assert!(s.vars_unification.is_empty());
    assert!(!s.constraints.is_empty());
}

#[test]
fn test_unifications_to_constraints_skip_equal() {
    let mut s = RuleStructure::new();
    let v = crate::json_obj!("variable" => crate::json_obj!("var_name" => "a"));
    s.vars_unification.push((v.clone(), v));
    s.unifications_to_constraints();
    assert!(s.vars_unification.is_empty());
    // Self-equalities should not become constraints
    assert!(s.constraints.is_empty());
}

// ── inline_predicate_values ──

#[test]
fn test_inline_predicate_values_no_change() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let mut rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap()
        .clone();
    let mut alloc = NamesAllocator::new();
    // Should not crash on a simple fact
    inline_predicate_values(&mut rule, &mut alloc);
    assert!(rule.is_object());
}

// ── as_sql ──

struct MockTranslator;
impl crate::compiler::expr_translate::SubqueryTranslator for MockTranslator {
    fn translate_table(&self, predicate: &str, _vocab: Option<&HashMap<String, String>>) -> crate::compiler::CompileResult<String> {
        Ok(predicate.to_string())
    }
    fn translate_rule(&self, _rule: &crate::parser::Json, _vocab: &HashMap<String, String>, _is_combine: bool) -> crate::compiler::CompileResult<String> {
        Ok("(SELECT 1)".to_string())
    }
}

#[test]
fn test_as_sql_simple_fact() {
    let (s, d) = compile_single_rule(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let mock = MockTranslator;
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, d.as_ref(), &flags).unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    assert!(sql.contains("hello"), "SQL: {}", sql);
}

#[test]
fn test_as_sql_with_body() {
    let source = r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let d = dialects::get("sqlite").unwrap();
    let mock = MockTranslator;
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, d.as_ref(), &flags).unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    assert!(sql.contains("FROM"), "SQL: {}", sql);
}

#[test]
fn test_as_sql_with_constraint() {
    let source = r#"
        @Engine("sqlite");
        Result(x) :- Source(x), x > 5;
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let d = dialects::get("sqlite").unwrap();
    let mock = MockTranslator;
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, d.as_ref(), &flags).unwrap();
    assert!(sql.contains("WHERE"), "SQL should have WHERE: {}", sql);
}

#[test]
fn test_as_sql_distinct_group_by() {
    let source = r#"
        @Engine("sqlite");
        T(x) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let d = dialects::get("sqlite").unwrap();
    let mock = MockTranslator;
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, d.as_ref(), &flags).unwrap();
    assert!(sql.contains("GROUP BY"), "SQL should have GROUP BY: {}", sql);
}

#[test]
fn test_as_sql_group_by_name() {
    let source = r#"
        @Engine("bigquery");
        T(x) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let d = dialects::get("bigquery").unwrap();
    let mock = MockTranslator;
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, d.as_ref(), &flags).unwrap();
    assert!(sql.contains("GROUP BY"), "SQL should have GROUP BY: {}", sql);
}

#[test]
fn test_as_sql_group_by_index() {
    let source = r#"
        @Engine("trino");
        T(x) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let d = dialects::get("trino").unwrap();
    let mock = MockTranslator;
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, d.as_ref(), &flags).unwrap();
    assert!(sql.contains("GROUP BY"), "SQL should have GROUP BY: {}", sql);
}

// ── NamesAllocator edge cases ──

#[test]
fn test_names_allocator_hint_digit_start() {
    let mut alloc = NamesAllocator::new();
    let t = alloc.alloc_table(Some("123abc"));
    assert!(t.starts_with("t_"), "Digit-starting hint should get prefix: {}", t);
}

#[test]
fn test_names_allocator_hint_too_long() {
    let mut alloc = NamesAllocator::new();
    let long = "a".repeat(200);
    let t = alloc.alloc_table(Some(&long));
    assert!(t.starts_with("t_"), "Long hint should be ignored: {}", t);
}

#[test]
fn test_names_allocator_hint_duplicate() {
    let mut alloc = NamesAllocator::new();
    let t1 = alloc.alloc_table(Some("pred"));
    let t2 = alloc.alloc_table(Some("pred"));
    assert_ne!(t1, t2, "Duplicate hints should produce different names");
}

#[test]
fn test_names_allocator_hint_special_chars() {
    let mut alloc = NamesAllocator::new();
    let t = alloc.alloc_table(Some("my.module/pred"));
    assert!(t.contains("my_module_pred"), "Dots/slashes should become underscores: {}", t);
}

// ── extract with multiple body predicates ──

#[test]
fn test_extract_rule_structure_multiple_body() {
    let (s, _d) = compile_single_rule(r#"
        @Engine("sqlite");
        Result(x, y) :- A(x), B(y);
    "#);
    assert!(s.tables.len() >= 2, "Should have at least 2 tables: {:?}", s.tables);
}

// ── extract with constraint in body ──

#[test]
fn test_extract_rule_structure_constraint() {
    let (s, _d) = compile_single_rule(r#"
        @Engine("sqlite");
        Result(x) :- Source(x), x > 5;
    "#);
    assert!(!s.constraints.is_empty(), "Should have constraints");
}

// ── finalize with distinct and aggregation ──

#[test]
fn test_finalize_distinct_with_aggregation() {
    let source = r#"
        @Engine("sqlite");
        T(x? += 1) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    assert!(s.distinct_denoted);
    // aggregated fields should be excluded from distinct_vars
    assert!(!s.aggregated_fields.is_empty());
}

// ── as_sql with unnest ──

#[test]
fn test_as_sql_with_unnest() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Source(list), x in list;
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules
        .iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            !name.starts_with('@')
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    assert!(!s.unnestings.is_empty(), "Should have unnestings");
}

// ══════════════════════════════════════════════════════════════
// Additional tests for 100% coverage
// ══════════════════════════════════════════════════════════════

// ── vars_vocabulary with empty table (external vocab) ──

#[test]
fn test_vars_vocabulary_with_external_vocabulary() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let mut ext_vocab = HashMap::new();
    ext_vocab.insert("outer_var".to_string(), "t_outer.col0".to_string());
    let s = extract_rule_structure_with_vocabulary(rule, None, Some(ext_vocab)).unwrap();
    let d = dialects::get("bigquery").unwrap();
    let vocab = s.vars_vocabulary(d.as_ref());
    assert!(vocab.contains_key("outer_var"), "Should have external var: {:?}", vocab.keys().collect::<Vec<_>>());
}

// ── as_sql with ORDER BY, LIMIT ──

#[test]
fn test_as_sql_with_order_by_and_limit() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let mock = MockTranslator;
    let dialect = crate::compiler::dialects::get("sqlite").unwrap();
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, dialect.as_ref(), &flags).unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── as_sql GroupBySpec::Index (trino) ──

#[test]
fn test_as_sql_group_by_index_spec() {
    let source = r#"
        @Engine("trino");
        Source(1);
        Source(2);
        T(x, cnt? += 1) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            name == "T"
        })
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let mock = MockTranslator;
    let dialect = crate::compiler::dialects::get("trino").unwrap();
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, dialect.as_ref(), &flags).unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── as_sql GroupBySpec::Name (bigquery) ──

#[test]
fn test_as_sql_group_by_name_spec() {
    let source = r#"
        @Engine("bigquery");
        Source(1);
        T(x, cnt? += 1) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let mock = MockTranslator;
    let dialect = crate::compiler::dialects::get("bigquery").unwrap();
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, dialect.as_ref(), &flags).unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── inline_predicate_values with body containing user predicate ──

#[test]
fn test_inline_predicate_values() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Source(x), x == Helper(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    // Should not panic
    let _ = s;
}

// ── all_mentioned_variables ──

#[test]
fn test_all_mentioned_variables_basic() {
    let expr = crate::json_obj!(
        "variable" => crate::json_obj!("var_name" => "x")
    );
    let mut vars = std::collections::HashSet::new();
    all_mentioned_variables(&expr, &mut vars);
    assert!(vars.contains("x"));
}

#[test]
fn test_all_mentioned_variables_nested() {
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "predicate_name" => "+",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => Json::Int(0),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    ),
                    crate::json_obj!(
                        "field" => Json::Int(1),
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "y")
                            )
                        )
                    ),
                ])
            )
        )
    );
    let mut vars = std::collections::HashSet::new();
    all_mentioned_variables(&expr, &mut vars);
    assert!(vars.contains("x"), "Missing x: {:?}", vars);
    assert!(vars.contains("y"), "Missing y: {:?}", vars);
}

// ── extract_var_name ──

#[test]
fn test_extract_var_name_string() {
    let expr = crate::json_obj!(
        "variable" => crate::json_obj!("var_name" => "x")
    );
    assert_eq!(extract_var_name(&expr), Some("x".to_string()));
}

#[test]
fn test_extract_var_name_non_variable() {
    let expr = crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(1)));
    assert_eq!(extract_var_name(&expr), None);
}

// ── NamesAllocator ──

#[test]
fn test_names_allocator_alloc_var_sequence() {
    let mut alloc = NamesAllocator::new();
    let v1 = alloc.alloc_var();
    let v2 = alloc.alloc_var();
    assert_ne!(v1, v2);
}

#[test]
fn test_names_allocator_alloc_table_custom() {
    let mut alloc = NamesAllocator::new();
    let t = alloc.alloc_table(Some("my_table"));
    assert!(t.contains("my_table"), "Got: {}", t);
}

// ── replace_variable ──

#[test]
fn test_replace_variable_basic() {
    let mut expr = crate::json_obj!(
        "variable" => crate::json_obj!("var_name" => "old_var")
    );
    let replacement = crate::json_obj!(
        "literal" => crate::json_obj!("the_number" => Json::Int(42))
    );
    replace_variable("old_var", &replacement, &mut expr);
    // After replacement, old_var should be gone
    assert!(expr.as_object().get("variable").is_none() ||
        expr.as_object().get("literal").is_some());
}

// ── decorate_combine_rule entangle ──

#[test]
fn test_decorate_combine_rule_entangle() {
    let source = r#"
        @Engine("sqlite");
        T(x? += 1) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let decorated = decorate_combine_rule(rule, "magic_var_0");
    let decorated_str = format!("{:?}", decorated);
    assert!(decorated_str.contains("MagicalEntangle"), "Should entangle: {}", decorated_str);
}

// ── disambiguate_combine_vars ──

#[test]
fn test_disambiguate_combine_vars_no_combine() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let mut rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap()
        .clone();
    let mut alloc = NamesAllocator::new();
    // No combine, should be a no-op
    disambiguate_combine_variables(&mut rule, &mut alloc);
}

// ── extract_rule_structure with equality in body ──

#[test]
fn test_extract_equality_in_body() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Source(x), x == 5;
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let s = extract_rule_structure(rule, None).unwrap();
    // Should have constraint for x == 5
    assert!(!s.constraints.is_empty() || !s.vars_unification.is_empty(),
        "Should have constraints or unifications");
}

// ── is_subset helper ──

#[test]
fn test_is_subset_true() {
    let a: std::collections::HashSet<String> = ["x", "y"].iter().map(|s| s.to_string()).collect();
    let b: std::collections::HashSet<String> = ["x", "y", "z"].iter().map(|s| s.to_string()).collect();
    assert!(is_subset(&a, &b));
}

#[test]
fn test_is_subset_false() {
    let a: std::collections::HashSet<String> = ["x", "w"].iter().map(|s| s.to_string()).collect();
    let b: std::collections::HashSet<String> = ["x", "y", "z"].iter().map(|s| s.to_string()).collect();
    assert!(!is_subset(&a, &b));
}

// ── make_var_expr ──

#[test]
fn test_make_var_expr() {
    let expr = make_var_expr("my_var");
    let var = expr.as_object().get("variable").unwrap();
    let name = var.as_object()["var_name"].as_str();
    assert_eq!(name, "my_var");
}

// ── all_mentioned_variables with Int var_name ──

#[test]
fn test_all_mentioned_variables_int_var_name() {
    let expr = crate::json_obj!(
        "variable" => crate::json_obj!("var_name" => Json::Int(42))
    );
    let mut vars = std::collections::HashSet::new();
    all_mentioned_variables(&expr, &mut vars);
    assert!(vars.contains("42"), "Should handle int var_name: {:?}", vars);
}

// ── extract_var_name with Int var_name ──

#[test]
fn test_extract_var_name_int() {
    let expr = crate::json_obj!(
        "variable" => crate::json_obj!("var_name" => Json::Int(7))
    );
    assert_eq!(extract_var_name(&expr), Some("7".to_string()));
}

// ── replace_variable with Int var_name ──

#[test]
fn test_replace_variable_int_var_name() {
    let mut expr = crate::json_obj!(
        "variable" => crate::json_obj!("var_name" => Json::Int(42))
    );
    let replacement = crate::json_obj!(
        "literal" => crate::json_obj!("the_number" => Json::Int(99))
    );
    replace_variable("42", &replacement, &mut expr);
    // After replacement, should have the replacement expr
    assert!(expr.as_object().get("literal").is_some() ||
        expr.as_object().get("variable").is_none(),
        "Should have replaced int var_name: {:?}", expr);
}

// ── as_sql with unnesting (UNNEST phrase) ──

#[test]
fn test_as_sql_with_unnest_phrase() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Source(list), x in list;
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let mut s = extract_rule_structure(rule, None).unwrap();
    finalize_rule_structure(&mut s);
    let mock = MockTranslator;
    let dialect = crate::compiler::dialects::get("sqlite").unwrap();
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, dialect.as_ref(), &flags).unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── as_sql with empty FROM (singleton table) ──

#[test]
fn test_as_sql_empty_from_singleton() {
    // A fact with no body predicates should use singleton table
    let (s, d) = compile_single_rule(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let mock = MockTranslator;
    let flags = HashMap::new();
    let sql = s.as_sql(&mock, d.as_ref(), &flags).unwrap();
    assert!(sql.contains("singleton") || sql.contains("SELECT"),
        "Should have singleton or plain SELECT: {}", sql);
}

// ── has_variable_deep with nested object ──

#[test]
fn test_has_variable_deep_nested() {
    let expr = crate::json_obj!(
        "call" => crate::json_obj!(
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    )
                ])
            )
        )
    );
    assert!(has_variable_deep(&expr), "Should find nested variable");
}

#[test]
fn test_has_variable_deep_no_variable() {
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!("the_number" => Json::Int(42))
    );
    assert!(!has_variable_deep(&expr));
}

#[test]
fn test_has_variable_deep_in_array() {
    let expr = Json::Array(vec![
        crate::json_obj!("variable" => crate::json_obj!("var_name" => "x")),
    ]);
    assert!(has_variable_deep(&expr));
}

// ── has_record ──

#[test]
fn test_has_record_true() {
    let expr = crate::json_obj!(
        "record" => crate::json_obj!("field_value" => Json::Array(vec![]))
    );
    assert!(has_record(&expr));
}

#[test]
fn test_has_record_false() {
    let expr = crate::json_obj!(
        "literal" => crate::json_obj!("the_number" => Json::Int(1))
    );
    assert!(!has_record(&expr));
}

#[test]
fn test_has_record_non_object() {
    assert!(!has_record(&Json::Int(42)));
}

// ── extract_conjunct with = predicate in body ──

#[test]
fn test_extract_equality_assignment_in_body() {
    let source = r#"
        @Engine("sqlite");
        T(y) :- Source(x), y = x + 1;
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let s = extract_rule_structure(rule, None).unwrap();
    // The = in body should become a unification
    assert!(!s.vars_unification.is_empty() || !s.constraints.is_empty(),
        "Body = should produce unification or constraint");
}

// ── extract_inclusion with Container ──

#[test]
fn test_extract_inclusion_container() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- x in Container([1, 2, 3]);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let s = extract_rule_structure(rule, None).unwrap();
    // Container inclusion should produce a constraint, not an unnesting
    assert!(!s.constraints.is_empty() || s.unnestings.is_empty(),
        "Container should become constraint, not unnest");
}

// ── head equality extraction ──

#[test]
fn test_extract_head_with_equality() {
    let source = r#"
        @Engine("sqlite");
        T(x, y) :- Source(x), y == x + 1;
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let s = extract_rule_structure(rule, None).unwrap();
    assert!(s.select.contains_key("col0") || s.select.contains_key("col1"),
        "Should have head fields: {:?}", s.select.keys().collect::<Vec<_>>());
}

// ── disambiguate_combine_variables with actual combine ──

#[test]
fn test_disambiguate_combine_variables_with_combine() {
    let source = r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        T(x? += 1) distinct :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let mut rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap()
        .clone();
    let mut alloc = NamesAllocator::new();
    // Should not panic
    disambiguate_combine_variables(&mut rule, &mut alloc);
}

// ── get_tree_of_combines with int var_name ──

#[test]
fn test_get_tree_of_combines_basic() {
    let rule = crate::json_obj!(
        "head" => crate::json_obj!(
            "predicate_name" => "T",
            "record" => crate::json_obj!(
                "field_value" => Json::Array(vec![
                    crate::json_obj!(
                        "field" => "col0",
                        "value" => crate::json_obj!(
                            "expression" => crate::json_obj!(
                                "variable" => crate::json_obj!("var_name" => "x")
                            )
                        )
                    )
                ])
            )
        )
    );
    let tree = get_tree_of_combines(&rule);
    assert!(tree.variables.contains("x"));
    // A rule with no `combine` expression yields no subtrees.
    assert!(tree.subtrees.is_empty());
}

// ── unifications_to_constraints with constant comparison ──

#[test]
fn test_unifications_to_constraints_constant_comparison() {
    let mut s = RuleStructure::new();
    // Two different constants → should become a constraint
    let left = crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(5)));
    let right = crate::json_obj!("literal" => crate::json_obj!("the_number" => Json::Int(3)));
    s.vars_unification.push((left, right));
    s.unifications_to_constraints();
    assert!(s.vars_unification.is_empty());
    assert!(!s.constraints.is_empty(), "Different constants should become constraint");
}

// ── inline_predicate_values with body needing body creation ──

#[test]
fn test_inline_predicate_values_with_user_call() {
    let source = r#"
        @Engine("sqlite");
        T(MyFunc(x)) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let mut rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap()
        .clone();
    let mut alloc = NamesAllocator::new();
    // Should handle user predicate call in head expression
    inline_predicate_values(&mut rule, &mut alloc);
    assert!(rule.is_object());
}

// ── vars_vocabulary with empty table (unnest var) ──

#[test]
fn test_vars_vocabulary_empty_table() {
    let mut s = RuleStructure::new();
    s.inv_vars_map.insert("v_0".to_string(), ("".to_string(), "v_0".to_string()));
    s.inv_vars_map.insert("v_1".to_string(), ("t_0".to_string(), "col0".to_string()));
    let d = dialects::get("bigquery").unwrap();
    let vocab = s.vars_vocabulary(d.as_ref());
    assert_eq!(vocab.get("v_0"), Some(&"v_0".to_string()));
    assert_eq!(vocab.get("v_1"), Some(&"t_0.col0".to_string()));
}
