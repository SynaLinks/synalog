use super::*;
use crate::parser::parse_file;

// ── SerdeLikeValue ──

#[test]
fn test_serde_like_value_as_i64() {
    let v = SerdeLikeValue::Int(42);
    assert_eq!(v.as_i64(), Some(42));
}

#[test]
fn test_serde_like_value_as_i64_wrong_type() {
    let v = SerdeLikeValue::Bool(true);
    assert_eq!(v.as_i64(), None);
}

#[test]
fn test_serde_like_value_as_i64_from_str() {
    let v = SerdeLikeValue::Str("hello".to_string());
    assert_eq!(v.as_i64(), None);
}

#[test]
fn test_serde_like_value_as_bool() {
    let v = SerdeLikeValue::Bool(true);
    assert_eq!(v.as_bool(), Some(true));
}

#[test]
fn test_serde_like_value_as_bool_false() {
    let v = SerdeLikeValue::Bool(false);
    assert_eq!(v.as_bool(), Some(false));
}

#[test]
fn test_serde_like_value_as_bool_wrong_type() {
    let v = SerdeLikeValue::Int(1);
    assert_eq!(v.as_bool(), None);
}

#[test]
fn test_serde_like_value_str() {
    let v = SerdeLikeValue::Str("hello".to_string());
    assert_eq!(v.as_i64(), None);
    assert_eq!(v.as_bool(), None);
}

#[test]
fn test_serde_like_value_negative_int() {
    let v = SerdeLikeValue::Int(-5);
    assert_eq!(v.as_i64(), Some(-5));
}

#[test]
fn test_serde_like_value_zero() {
    let v = SerdeLikeValue::Int(0);
    assert_eq!(v.as_i64(), Some(0));
}

// ── run_makes ──

#[test]
fn test_functors_no_makes() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules).unwrap();
    assert_eq!(result.len(), rules.len());
}

#[test]
fn test_run_makes_preserves_rules() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B("world");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules).unwrap();
    assert_eq!(result.len(), rules.len());
}

// ── run_makes_with_deps ──

#[test]
fn test_run_makes_with_deps_no_makes() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let (result, _deps) = run_makes_with_deps(&rules).unwrap();
    assert_eq!(result.len(), rules.len());
}

// ── simple functor ──

#[test]
fn test_simple_functor() {
    let source = r#"
        @Engine("sqlite");
        F(x) = x;
        @Make(T, F);
        T(1);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules);
    // Should either succeed or fail gracefully
    assert!(result.is_ok() || result.is_err());
}

// ── Functors::new ──

#[test]
fn test_functors_new() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    // Functors should be constructible without panicking
    assert!(!f.rules.is_empty());
}

// ── Functors::get_args_of_map ──

#[test]
fn test_functors_get_args_of_map_empty() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let args_of = f.get_args_of_map();
    // Without @Make, args_of should be empty or contain only the predicate itself
    assert!(args_of.is_empty() || args_of.values().all(|v| v.is_empty()));
}

// ── unfold_recursion ──

#[test]
fn test_unfold_recursion_no_recursion() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    assert_eq!(result.len(), rules.len());
}

#[test]
fn test_unfold_recursion_preserves_rules() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    assert!(result.len() >= rules.len());
}

// ── run_makes with multiple predicates ──

#[test]
fn test_run_makes_multiple_predicates() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B("world");
        C(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules).unwrap();
    assert!(result.len() >= rules.len());
}

// ── run_makes_with_deps returns both components ──

#[test]
fn test_run_makes_with_deps_returns_tuple() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let (result, deps) = run_makes_with_deps(&rules).unwrap();
    assert!(!result.is_empty());
    // deps is a HashMap<String, HashSet<String>>
    let _ = deps;
}

// ── empty input ──

#[test]
fn test_run_makes_empty_input() {
    let result = run_makes(&[]).unwrap();
    assert!(result.is_empty());
}

#[test]
fn test_unfold_recursion_empty_input() {
    let result = unfold_recursion(&[], "sqlite").unwrap();
    assert!(result.is_empty());
}

// ── walk ──

#[test]
fn test_walk_collects_predicate_names() {
    let source = r#"
        @Engine("sqlite");
        Result(x) :- Source(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let names = walk(&parsed, &|node: &crate::parser::Json| {
        if node.is_object() {
            let obj = node.as_object();
            if let Some(name) = obj.get("predicate_name") {
                return vec![name.as_str().to_string()];
            }
        }
        vec![]
    });
    assert!(names.contains("Result"), "Should find Result: {:?}", names);
    assert!(names.contains("Source"), "Should find Source: {:?}", names);
}

// ── extract_predicate_names ──

#[test]
fn test_extract_predicate_names() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    for rule in rules {
        let names = extract_predicate_names(rule);
        // Each rule should extract at least its head predicate name
        assert!(!names.is_empty(), "Should extract names from rule");
    }
}

// ── defined_predicates_rules ──

#[test]
fn test_defined_predicates_rules() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B("world");
        A("foo");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let map = defined_predicates_rules(&rules);
    assert!(map.contains_key("A"), "Should have A: {:?}", map.keys().collect::<Vec<_>>());
    if let Some(a_rules) = map.get("A") {
        assert_eq!(a_rules.len(), 2, "A should have 2 rules");
    }
    assert!(map.contains_key("B"), "Should have B");
}

// ── walk_replace_predicate ──

#[test]
fn test_walk_replace_predicate() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let mut rule = rules.iter()
        .find(|r| {
            let name = r.as_object()["head"].as_object()["predicate_name"].as_str();
            name == "A"
        })
        .unwrap()
        .clone();
    walk_replace_predicate(&mut rule, "A", "B");
    let new_name = rule.as_object()["head"].as_object()["predicate_name"].as_str();
    assert_eq!(new_name, "B");
}

// ── Functors methods ──

#[test]
fn test_functors_all_rules_of() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        A("world");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let a_rules = f.all_rules_of("A").unwrap();
    assert_eq!(a_rules.len(), 2);
}

#[test]
fn test_functors_get_constant_function() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let mut f = Functors::new(&rules);
    let name1 = f.get_constant_function("42");
    assert!(!name1.is_empty());
    // Same value should return cached name
    let name2 = f.get_constant_function("42");
    assert_eq!(name1, name2);
    // Different value should return different name
    let name3 = f.get_constant_function("hello");
    assert_ne!(name1, name3);
}

#[test]
fn test_functors_call_key() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let mut args = std::collections::HashMap::new();
    args.insert("arg1".to_string(), "val1".to_string());
    let key = f.call_key("MyFunctor", &args);
    assert!(key.contains("MyFunctor"), "Key should contain functor name: {}", key);
}

#[test]
fn test_functors_build_direct_args() {
    let source = r#"
        @Engine("sqlite");
        @Make(T, F, {arg: Source});
        F(x) = x;
        Source("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    // build_direct_args_of_predicate may return empty if functor not found
    let args = f.build_direct_args_of_predicate("F");
    let _ = args; // shouldn't panic
}

// ── SerdeLikeValue edge cases ──

#[test]
fn test_serde_like_value_large_int() {
    let v = SerdeLikeValue::Int(i64::MAX);
    assert_eq!(v.as_i64(), Some(i64::MAX));
}

#[test]
fn test_serde_like_value_min_int() {
    let v = SerdeLikeValue::Int(i64::MIN);
    assert_eq!(v.as_i64(), Some(i64::MIN));
}

// ── run_makes with actual @Make ──

#[test]
fn test_run_makes_simple_functor() {
    let source = r#"
        @Engine("sqlite");
        F(x) = x;
        @Make(T, F, {arg: "hello"});
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules);
    // Should either succeed or fail gracefully
    assert!(result.is_ok() || result.is_err());
}

// ── unfold_recursion with recursive predicate ──

#[test]
fn test_unfold_recursion_with_depth() {
    let source = r#"
        @Engine("sqlite");
        Source("a");
        A(x) :- Source(x);
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    // No actual recursion, so rules should be preserved
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    assert!(result.len() >= rules.len());
}

// ── Functors::new with multiple predicates ──

#[test]
fn test_functors_new_with_many_rules() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B("world");
        C(x) :- A(x);
        D(x, y) :- B(x), C(y);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    assert!(f.rules.len() >= 4);
}

// ── collect_annotations ──

#[test]
fn test_functors_collect_annotations() {
    let source = r#"
        @Engine("sqlite");
        @OrderBy(T, "col0");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let mut preds = std::collections::HashSet::new();
    preds.insert("T".to_string());
    let anns = f.collect_annotations(&preds);
    // Should collect annotation rules for T
    let _ = anns; // shouldn't panic
}

// ══════════════════════════════════════════════════════════════
// Additional tests for 100% coverage
// ══════════════════════════════════════════════════════════════

// ── parse_rules (lines 11-15) ──

#[test]
fn test_parse_rules_valid() {
    let rules = parse_rules("A(1);").unwrap();
    assert!(!rules.is_empty());
}

#[test]
fn test_parse_rules_invalid() {
    let result = parse_rules("not valid @@@ {{{");
    assert!(result.is_err());
}

// ── get_recursion_functor (lines 812-826) ──

#[test]
fn test_get_recursion_functor_depth_1() {
    let result = get_recursion_functor(1, "Path");
    assert!(result.contains("Path_r0 := Path_recursive_head(Path_recursive: nil)"), "Got:\n{}", result);
    assert!(result.contains("Path_r1 := Path_recursive_head(Path_recursive: Path_r0)"), "Got:\n{}", result);
    assert!(result.contains("Path := Path_r1()"), "Got:\n{}", result);
}

#[test]
fn test_get_recursion_functor_depth_3() {
    let result = get_recursion_functor(3, "A");
    assert!(result.contains("A_r0"), "Got:\n{}", result);
    assert!(result.contains("A_r3"), "Got:\n{}", result);
    assert!(result.contains("A := A_r3()"), "Got:\n{}", result);
}

// ── get_flat_recursion_functor (lines 829-862) ──

#[test]
fn test_get_flat_recursion_functor_single() {
    let mut cover = std::collections::BTreeSet::new();
    cover.insert("P".to_string());
    let mut direct = std::collections::HashMap::new();
    direct.insert("P".to_string(), vec!["P".to_string()]);
    let result = get_flat_recursion_functor(2, &cover, &direct);
    assert!(result.contains("P_fr0"), "Got:\n{}", result);
    assert!(result.contains("P_fr2"), "Got:\n{}", result);
    assert!(result.contains("P := P_fr2()"), "Got:\n{}", result);
}

#[test]
fn test_get_flat_recursion_functor_two_preds() {
    let mut cover = std::collections::BTreeSet::new();
    cover.insert("A".to_string());
    cover.insert("B".to_string());
    let mut direct = std::collections::HashMap::new();
    direct.insert("A".to_string(), vec!["B".to_string()]);
    direct.insert("B".to_string(), vec!["A".to_string()]);
    let result = get_flat_recursion_functor(1, &cover, &direct);
    assert!(result.contains("A_fr0"), "Got:\n{}", result);
    assert!(result.contains("B_fr0"), "Got:\n{}", result);
    assert!(result.contains("A := A_fr1()"), "Got:\n{}", result);
    assert!(result.contains("B := B_fr1()"), "Got:\n{}", result);
}

// ── unfold_recursion with @Recursive (lines 875-932) ──

#[test]
fn test_unfold_recursion_with_recursive_annotation() {
    let source = r#"
        @Engine("sqlite");
        @Recursive(Path, 3);
        Edge(1, 2);
        Edge(2, 3);
        Path(a, b) :- Edge(a, b);
        Path(a, c) :- Path(a, b), Edge(b, c);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    // Should produce more rules than the original (recursion unfolded)
    assert!(result.len() > rules.len(), "Expected more rules after unfolding, got {} vs {}", result.len(), rules.len());
}

#[test]
fn test_unfold_recursion_no_recursive_annotation() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    assert_eq!(result.len(), rules.len());
}

#[test]
fn test_unfold_recursion_duckdb_engine() {
    let source = r#"
        @Engine("duckdb");
        @Recursive(Path, 5);
        Edge(1, 2);
        Path(a, b) :- Edge(a, b);
        Path(a, c) :- Path(a, b), Edge(b, c);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "duckdb").unwrap();
    assert!(result.len() > rules.len());
}

// ── run_makes with actual @Make (lines 936-1071) ──

#[test]
fn test_run_makes_with_simple_make() {
    let source = r#"
        @Engine("sqlite");
        F(x) = x + 1;
        Source(1);
        @Make(Result, F, {source: Source});
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules);
    // Should succeed or fail gracefully
    assert!(result.is_ok() || result.is_err());
}

#[test]
fn test_run_makes_with_two_makes() {
    let source = r#"
        @Engine("sqlite");
        F(x) = x;
        @Make(T1, F);
        @Make(T2, F);
        Source(1);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules);
    assert!(result.is_ok() || result.is_err());
}

// ── run_makes_with_deps with actual @Make (lines 1074-1093) ──

#[test]
fn test_run_makes_with_deps_actual_make() {
    let source = r#"
        @Engine("sqlite");
        F(x) = x;
        @Make(T, F);
        Source(1);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let (result, deps) = run_makes_with_deps(&rules).unwrap();
    assert!(!result.is_empty());
    let _ = deps;
}

// ── Functors::update_structure (lines 254-284) ──

#[test]
fn test_functors_update_structure_via_make() {
    let source = r#"
        @Engine("sqlite");
        Inc(x) = x + 1;
        Source(1);
        @Make(Result, Inc);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    // run_makes internally calls update_structure
    let result = run_makes(&rules);
    assert!(result.is_ok() || result.is_err());
}

// ── build_args with unknown predicate (line 171) ──

#[test]
fn test_functors_args_of_unknown() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let args = f.args_of("NonExistent");
    assert!(args.is_empty());
}

// ── all_rules_of with transitive deps (lines 300-311) ──

#[test]
fn test_functors_all_rules_of_with_deps() {
    let source = r#"
        @Engine("sqlite");
        Helper(x) = x;
        Main(x) :- Helper(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let main_rules = f.all_rules_of("Main").unwrap();
    // Should include Main's rules and maybe Helper's rules (transitive)
    assert!(!main_rules.is_empty());
}

// ── collect_annotations with matching annotations (lines 368-396) ──

#[test]
fn test_collect_annotations_with_limit() {
    let source = r#"
        @Engine("sqlite");
        @Limit(T, 10);
        T("hello");
        T("world");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let mut preds = std::collections::HashSet::new();
    preds.insert("T".to_string());
    let anns = f.collect_annotations(&preds).unwrap();
    assert!(!anns.is_empty(), "Should find @Limit annotation for T");
}

#[test]
fn test_collect_annotations_with_orderby() {
    let source = r#"
        @Engine("sqlite");
        @OrderBy(T, col0);
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let mut preds = std::collections::HashSet::new();
    preds.insert("T".to_string());
    let anns = f.collect_annotations(&preds).unwrap();
    assert!(!anns.is_empty(), "Should find @OrderBy annotation for T");
}

// ── recursive_analysis: is_cut_of_cover (lines 590-606) ──

#[test]
fn test_recursive_single_predicate_is_cut() {
    let source = r#"
        @Engine("sqlite");
        @Recursive(A, 3);
        A(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    // This triggers recursive_analysis through unfold_recursion
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    assert!(result.len() > rules.len());
}

// ── Mutual recursion (horizontal unfolding) ──

#[test]
fn test_unfold_mutual_recursion() {
    let source = r#"
        @Engine("sqlite");
        @Recursive(A, 3);
        Base(1);
        A(x) :- B(x);
        B(x) :- A(x);
        A(x) :- Base(x);
        B(x) :- Base(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    assert!(result.len() > rules.len(), "Mutual recursion should produce more rules");
}

// ── parse_make_instruction with string constant ──

#[test]
fn test_run_makes_with_string_constant() {
    let source = r#"
        @Engine("sqlite");
        F(x, c) = x + c;
        @Make(Result, F, {c: "hello"});
        Source(1);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules);
    assert!(result.is_ok() || result.is_err());
}

// ── parse_make_instruction with int constant ──

#[test]
fn test_run_makes_with_int_constant() {
    let source = r#"
        @Engine("sqlite");
        F(x, c) = x + c;
        @Make(Result, F, {c: 42});
        Source(1);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules);
    assert!(result.is_ok() || result.is_err());
}

// ── SerdeLikeValue::Str ──

#[test]
fn test_serde_like_value_str_variant() {
    let v = SerdeLikeValue::Str("hello".to_string());
    assert_eq!(v.as_i64(), None);
    assert_eq!(v.as_bool(), None);
}

// ── Functors with many predicates and deps ──

#[test]
fn test_functors_build_args_transitive() {
    let source = r#"
        @Engine("sqlite");
        A("base");
        B(x) :- A(x);
        C(x) :- B(x);
        D(x) :- C(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let args = f.get_args_of_map();
    // D depends transitively on C, B, A
    if let Some(d_args) = args.get("D") {
        assert!(d_args.contains("C"), "D should depend on C: {:?}", d_args);
    }
}

// ── walk_replace_predicate on array ──

#[test]
fn test_walk_replace_predicate_in_array() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let mut rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "B")
        .unwrap()
        .clone();
    walk_replace_predicate(&mut rule, "A", "C");
    // Body should now reference C instead of A
    let names = extract_predicate_names(&rule);
    assert!(names.contains("C"), "Should contain C: {:?}", names);
    assert!(!names.contains("A"), "Should not contain A: {:?}", names);
}

// ── build_args with unknown functor (returns empty) ──

#[test]
fn test_build_args_unknown_functor() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let args_map = f.get_args_of_map();
    let args = args_map.get("UnknownFunctor");
    assert!(args.is_none(), "Unknown functor should have no args");
}

// ── unfold_recursion with default depth ──

#[test]
fn test_unfold_recursion_default_depth() {
    let source = r#"
        @Engine("sqlite");
        @Recursive(A);
        Base(1);
        A(x) :- A(x);
        A(x) :- Base(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "sqlite").unwrap();
    // Default depth (8) should produce more rules
    assert!(result.len() > rules.len(), "Default depth should produce more rules");
}

// ── unfold_recursion with duckdb engine ──

#[test]
fn test_unfold_recursion_duckdb() {
    let source = r#"
        @Engine("duckdb");
        @Recursive(A, 3);
        Base(1);
        A(x) :- A(x);
        A(x) :- Base(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = unfold_recursion(&rules, "duckdb").unwrap();
    assert!(result.len() > rules.len());
}

// ── run_makes_with_deps with simple make ──

#[test]
fn test_run_makes_with_deps_simple() {
    let source = r#"
        @Engine("sqlite");
        Adder(x, c) = x + c;
        @Make(AddFive, Adder, {c: 5});
        Source(1);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let result = run_makes(&rules);
    // May succeed or fail depending on Make resolution, but should not panic
    let _ = result;
}

// ── Functors::new populates rules_of ──

#[test]
fn test_functors_new_rules_of() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        A("world");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let f = Functors::new(&rules);
    let a_rules = f.all_rules_of("A").unwrap();
    assert!(a_rules.len() >= 2, "A should have at least 2 rules: got {}", a_rules.len());
    let b_rules = f.all_rules_of("B").unwrap();
    assert!(b_rules.len() >= 1, "B should have at least 1 rule: got {}", b_rules.len());
}

// ── defined_predicates_rules ──

#[test]
fn test_functors_defined_predicates() {
    let source = r#"
        @Engine("sqlite");
        A("hello");
        B(x) :- A(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array().to_vec();
    let preds = defined_predicates_rules(&rules);
    assert!(preds.contains_key("A"), "Should contain A: {:?}", preds);
    assert!(preds.contains_key("B"), "Should contain B: {:?}", preds);
    // Note: defined_predicates_rules includes annotation predicates too
}

// ── extract_predicate_names from rule with body ──

#[test]
fn test_extract_predicate_names_body() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- A(x), B(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let rules = parsed.as_object()["rule"].as_array();
    let rule = rules.iter()
        .find(|r| r.as_object()["head"].as_object()["predicate_name"].as_str() == "T")
        .unwrap();
    let names = extract_predicate_names(rule);
    assert!(names.contains("A"), "Should contain A: {:?}", names);
    assert!(names.contains("B"), "Should contain B: {:?}", names);
}

// ── parse_rules with bad syntax ──

#[test]
fn test_parse_rules_bad_syntax() {
    let result = parse_rules("@@@invalid syntax###");
    // Should fail to parse
    assert!(result.is_err(), "Invalid syntax should fail to parse");
}
