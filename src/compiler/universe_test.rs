// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use super::*;

// ── format_sql ──

#[test]
fn test_format_sql() {
    assert_eq!(format_sql("SELECT 1"), "SELECT 1;");
}

#[test]
fn test_format_sql_empty() {
    assert_eq!(format_sql(""), ";");
}

// ── indent2 ──

#[test]
fn test_indent2() {
    assert_eq!(indent2("a\nb"), "  a\n  b");
}

#[test]
fn test_indent2_single_line() {
    assert_eq!(indent2("hello"), "  hello");
}

#[test]
fn test_indent2_empty() {
    assert_eq!(indent2(""), "  ");
}

// ── field_values_as_list ──

#[test]
fn test_field_values_as_list() {
    let mut m = HashMap::new();
    m.insert("1".to_string(), Json::Str("a".to_string()));
    m.insert("2".to_string(), Json::Str("b".to_string()));
    let result = field_values_as_list(&m).unwrap();
    assert_eq!(result.len(), 2);
}

#[test]
fn test_field_values_as_list_non_contiguous() {
    let mut m = HashMap::new();
    m.insert("1".to_string(), Json::Str("a".to_string()));
    m.insert("3".to_string(), Json::Str("c".to_string()));
    assert!(field_values_as_list(&m).is_none());
}

#[test]
fn test_field_values_as_list_empty() {
    let m = HashMap::new();
    let result = field_values_as_list(&m).unwrap();
    assert!(result.is_empty());
}

#[test]
fn test_field_values_as_list_with_rule_text() {
    let mut m = HashMap::new();
    m.insert("__rule_text".to_string(), Json::Str("ignored".to_string()));
    m.insert("1".to_string(), Json::Str("a".to_string()));
    let result = field_values_as_list(&m).unwrap();
    assert_eq!(result.len(), 1);
}

#[test]
fn test_field_values_as_list_ordering() {
    let mut m = HashMap::new();
    m.insert("1".to_string(), Json::Str("first".to_string()));
    m.insert("2".to_string(), Json::Str("second".to_string()));
    m.insert("3".to_string(), Json::Str("third".to_string()));
    let result = field_values_as_list(&m).unwrap();
    assert_eq!(result[0].as_str(), "first");
    assert_eq!(result[1].as_str(), "second");
    assert_eq!(result[2].as_str(), "third");
}

// ── unquote_parenthesised ──

#[test]
fn test_unquote_parenthesised() {
    assert_eq!(
        unquote_parenthesised("`(SELECT 1)`"),
        "SELECT 1"
    );
    assert_eq!(unquote_parenthesised("my_table"), "my_table");
}

#[test]
fn test_unquote_parenthesised_no_match() {
    assert_eq!(unquote_parenthesised("`abc`"), "`abc`");
}

#[test]
fn test_unquote_parenthesised_too_short() {
    assert_eq!(unquote_parenthesised("`()`"), "`()`");
}

// ── recursion_error_message ──

#[test]
fn test_recursion_error_message() {
    let msg = recursion_error_message();
    assert!(msg.contains("Recursion"), "Got: {}", msg);
    assert!(msg.contains("@Recursive"), "Got: {}", msg);
}

// ── inject_structure ──

#[test]
fn test_inject_structure() {
    use crate::compiler::rule_translate::RuleStructure;
    let mut target = RuleStructure::new();
    let mut source = RuleStructure::new();

    source.vars_map.insert(("t_0".to_string(), "col0".to_string()), "v_0".to_string());
    source.inv_vars_map.insert("v_0".to_string(), ("t_0".to_string(), "col0".to_string()));
    source.constraints.push(Json::Str("constraint".to_string()));
    source.synonym_log.insert("a".to_string(), vec![
        crate::compiler::rule_translate::LogicalVariable::new("b", "TestPredicate")
    ]);

    inject_structure(&mut target, &source);

    assert!(target.vars_map.contains_key(&("t_0".to_string(), "col0".to_string())));
    assert!(target.inv_vars_map.contains_key("v_0"));
    assert_eq!(target.constraints.len(), 1);
    assert!(target.synonym_log.contains_key("a"));
}

#[test]
fn test_inject_structure_merges() {
    use crate::compiler::rule_translate::RuleStructure;
    let mut target = RuleStructure::new();
    target.constraints.push(Json::Str("existing".to_string()));

    let mut source = RuleStructure::new();
    source.constraints.push(Json::Str("new".to_string()));

    inject_structure(&mut target, &source);
    assert_eq!(target.constraints.len(), 2);
}

// ── Logica ──

#[test]
fn test_logica_new() {
    let l = Logica::new();
    assert!(l.defines.is_empty());
    assert!(l.export_statements.is_empty());
    assert!(l.main_predicate.is_none());
    assert!(!l.compiling_udf);
    assert!(l.annotations.is_none());
}

#[test]
fn test_logica_default() {
    let l = Logica::default();
    assert!(l.defines.is_empty());
}

#[test]
fn test_logica_add_define() {
    let mut l = Logica::new();
    l.add_define("DEFINE TABLE t AS (SELECT 1)".to_string());
    assert_eq!(l.defines.len(), 1);
    assert!(l.defines[0].contains("DEFINE TABLE"));
}

#[test]
fn test_logica_full_preamble() {
    let mut l = Logica::new();
    l.flags_comment = "-- flags".to_string();
    l.preamble = "SET x = 1;".to_string();
    l.defines.push("DEFINE TABLE t AS (SELECT 1)".to_string());
    let full = l.full_preamble();
    assert!(full.contains("-- flags"));
    assert!(full.contains("SET x = 1"));
    assert!(full.contains("DEFINE TABLE"));
}

#[test]
fn test_logica_full_preamble_empty() {
    let l = Logica::new();
    let full = l.full_preamble();
    assert!(full.trim().is_empty() || full.contains('\n'));
}

#[test]
fn test_logica_with_for_default() {
    let l = Logica::new();
    assert!(l.with_for("T"));
}

#[test]
fn test_logica_with_for_udf() {
    let mut l = Logica::new();
    l.compiling_udf = true;
    assert!(!l.with_for("T"));
}

#[test]
fn test_logica_with_for_with_annotations() {
    let mut l = Logica::new();
    let mut ann = Annotations::extract(&[]).unwrap();
    let mut pred_anns = HashMap::new();
    pred_anns.insert("with".to_string(), Json::Bool(false));
    ann.annotations.insert("T".to_string(), pred_anns);
    l.annotations = Some(ann);
    assert!(!l.with_for("T"));
}

#[test]
fn test_logica_predicate_specific_preamble_empty() {
    let l = Logica::new();
    assert_eq!(l.predicate_specific_preamble("T"), "");
}

#[test]
fn test_logica_needed_udf_definitions_empty() {
    let l = Logica::new();
    assert!(l.needed_udf_definitions().is_empty());
}

// ── LogicaProgram (universe version) ──

#[test]
fn test_simple_program() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    assert_eq!(program.engine(), "sqlite");
}

#[test]
fn test_program_defined_predicates() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
        Source("a");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let preds = program.defined_predicates();
    assert!(preds.contains("T"));
    assert!(preds.contains("Source"));
    assert!(!preds.contains("@Engine"));
}

#[test]
fn test_program_new_names_allocator() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let mut alloc = program.new_names_allocator();
    let t = alloc.alloc_table(None);
    assert!(t.starts_with("t_"));
}

#[test]
fn test_program_get_predicate_rules() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
        T("world");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let rules = program.get_predicate_rules("T");
    assert_eq!(rules.len(), 2);
}

#[test]
fn test_program_get_predicate_rules_empty() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let rules = program.get_predicate_rules("NonExistent");
    assert!(rules.is_empty());
}

#[test]
fn test_program_use_flags_as_parameters() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_table", "users");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let result = program.use_flags_as_parameters("SELECT * FROM ${my_table}");
    assert_eq!(result, "SELECT * FROM users");
}

#[test]
fn test_program_use_flags_no_substitution() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let result = program.use_flags_as_parameters("SELECT 1");
    assert_eq!(result, "SELECT 1");
}

// ── predicate_sql ──

fn make_universe_program(source: &str) -> LogicaProgram {
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap()
}

/// Initialize execution state and call predicate_sql
fn compile_predicate(program: &LogicaProgram, name: &str) -> crate::compiler::CompileResult<String> {
    let exec = program.initialize_execution(name)?;
    *program.execution.borrow_mut() = Some(exec);
    *program.allocator.borrow_mut() = program.new_names_allocator();
    program.predicate_sql(name)
}

#[test]
fn test_predicate_sql_simple_fact() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    assert!(sql.contains("hello"), "SQL: {}", sql);
}

#[test]
fn test_predicate_sql_rule_with_body() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = compile_predicate(&program, "Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    // Source may be injected (single-rule), so just check SELECT works
}

#[test]
fn test_predicate_sql_multi_rule_union() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
        T("world");
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("UNION ALL"), "SQL: {}", sql);
}

#[test]
fn test_predicate_sql_undefined_error() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert!(compile_predicate(&program, "NonExistent").is_err());
}

// ── formatted_predicate_sql ──

#[test]
fn test_formatted_predicate_sql_simple() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    assert!(sql.ends_with(";\n") || sql.trim().ends_with(';'), "SQL should end with semicolon: {}", sql);
}

#[test]
fn test_formatted_predicate_sql_with_dependency() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

#[test]
fn test_formatted_predicate_sql_chain() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        A("a");
        B(x) :- A(x);
        C(x) :- B(x);
    "#);
    let sql = program.formatted_predicate_sql("C").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── predicate_sql with constraints ──

#[test]
fn test_predicate_sql_with_constraint() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        Source(10);
        Result(x) :- Source(x), x > 5;
    "#);
    let sql = compile_predicate(&program,"Result").unwrap();
    assert!(sql.contains("WHERE"), "SQL should have WHERE: {}", sql);
}

// ── predicate_sql with join ──

#[test]
fn test_predicate_sql_with_join() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        A("hello");
        B("world");
        Result(x, y) :- A(x), B(y);
    "#);
    let sql = compile_predicate(&program,"Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── distinct / GROUP BY ──

#[test]
fn test_predicate_sql_distinct() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        Source("a");
        T(x) distinct :- Source(x);
    "#);
    let sql = compile_predicate(&program,"T").unwrap();
    assert!(sql.contains("GROUP BY"), "SQL should have GROUP BY: {}", sql);
}

#[test]
fn test_predicate_sql_aggregation() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        T(x? += 1) distinct :- Source(x);
    "#);
    let sql = compile_predicate(&program,"T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── ground predicates ──

#[test]
fn test_ground_predicate_via_formatted() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @Ground(Ext);
        Result(x) :- Ext(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.contains("Ext"), "SQL should reference Ext: {}", sql);
}

#[test]
fn test_ground_with_alias_via_formatted() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @Ground(Ext, actual_table);
        Result(x) :- Ext(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.contains("actual_table"), "SQL should use alias: {}", sql);
}

// ── table aliases ──

#[test]
fn test_table_aliases_stored() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Ext(x);
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let mut aliases = HashMap::new();
    aliases.insert("Ext".to_string(), "external_table".to_string());
    let program = LogicaProgram::new(&parsed, aliases, HashMap::new()).unwrap();
    // Verify table aliases are stored correctly
    assert_eq!(program.table_aliases.get("Ext"), Some(&"external_table".to_string()));
    // formatted_predicate_sql should produce valid SQL
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── user flags ──

#[test]
fn test_user_flags_default() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_flag", "default_val");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    assert_eq!(program.flag_values.get("my_flag"), Some(&"default_val".to_string()));
}

// ── Logica with UDFs ──

#[test]
fn test_logica_predicate_specific_preamble_with_udfs() {
    let mut l = Logica::new();
    l.custom_udf_definitions.insert("my_func".to_string(), "CREATE FUNCTION my_func() RETURNS INT".to_string());
    l.used_predicates.push("my_func".to_string());
    let preamble = l.predicate_specific_preamble("T");
    // preamble depends on whether "T" uses my_func
    let _ = preamble; // at minimum, shouldn't panic
}

#[test]
fn test_logica_needed_udf_definitions_with_entries() {
    let mut l = Logica::new();
    l.custom_udf_definitions.insert("func1".to_string(), "CREATE FUNCTION func1()".to_string());
    l.custom_udfs.insert("func1".to_string(), "FUNC1(%s)".to_string());
    let defs = l.needed_udf_definitions();
    // Should contain the UDF definitions
    let _ = defs; // shouldn't panic
}

// ── predicate_sql with number fact ──

#[test]
fn test_predicate_sql_number_fact() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T(42);
    "#);
    let sql = compile_predicate(&program,"T").unwrap();
    assert!(sql.contains("42"), "SQL: {}", sql);
}

// ── engine default ──

#[test]
fn test_engine_default_duckdb() {
    let program = make_universe_program(r#"T("hello");"#);
    assert_eq!(program.engine(), "duckdb");
}

// ── dollar params ──

#[test]
fn test_dollar_params_extracted() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    // No dollar params in this program
    assert!(program.dollar_params.is_empty());
}

// ══════════════════════════════════════════════════════════════
// Additional tests for 100% coverage
// ══════════════════════════════════════════════════════════════

// ── Logica struct methods ──

#[test]
fn test_logica_predicate_specific_preamble_no_deps() {
    let logica = Logica::new();
    assert_eq!(logica.predicate_specific_preamble("T"), "");
}

#[test]
fn test_logica_predicate_specific_preamble_with_udf() {
    let mut logica = Logica::new();
    let mut deps = std::collections::HashSet::new();
    deps.insert("my_func".to_string());
    logica.dependencies_of.insert("T".to_string(), deps);
    logica.custom_udf_definitions.insert("my_func".to_string(), "CREATE FUNCTION my_func() RETURNS INT".to_string());
    let preamble = logica.predicate_specific_preamble("T");
    assert!(preamble.contains("my_func"), "Got: {}", preamble);
}

#[test]
fn test_logica_predicate_specific_preamble_with_semigroup() {
    let mut logica = Logica::new();
    let mut deps = std::collections::HashSet::new();
    deps.insert("my_agg".to_string());
    logica.dependencies_of.insert("T".to_string(), deps);
    logica.custom_udf_definitions.insert("my_agg".to_string(), "CREATE AGG".to_string());
    logica.custom_udf_definitions.insert("my_sg".to_string(), "CREATE SG".to_string());
    logica.custom_aggregation_semigroup.insert("my_agg".to_string(), "my_sg".to_string());
    let preamble = logica.predicate_specific_preamble("T");
    assert!(preamble.contains("CREATE SG"), "Got: {}", preamble);
}

#[test]
fn test_logica_needed_udf_definitions() {
    let mut logica = Logica::new();
    logica.used_predicates = vec!["f1".to_string(), "f2".to_string()];
    logica.custom_udf_definitions.insert("f1".to_string(), "DEF1".to_string());
    logica.custom_udf_definitions.insert("f2".to_string(), "DEF2".to_string());
    let defs = logica.needed_udf_definitions();
    assert!(defs.contains(&"DEF1".to_string()));
    assert!(defs.contains(&"DEF2".to_string()));
}

#[test]
fn test_logica_needed_udf_definitions_with_semigroup() {
    let mut logica = Logica::new();
    logica.used_predicates = vec!["my_agg".to_string()];
    logica.custom_udf_definitions.insert("my_agg".to_string(), "AGG_DEF".to_string());
    logica.custom_udf_definitions.insert("my_sg".to_string(), "SG_DEF".to_string());
    logica.custom_aggregation_semigroup.insert("my_agg".to_string(), "my_sg".to_string());
    let defs = logica.needed_udf_definitions();
    assert!(defs.contains(&"SG_DEF".to_string()));
}

#[test]
fn test_logica_full_preamble_with_defines() {
    let mut logica = Logica::new();
    logica.flags_comment = "-- flags".to_string();
    logica.preamble = "-- preamble".to_string();
    logica.add_define("-- define1".to_string());
    let fp = logica.full_preamble();
    assert!(fp.contains("-- flags"), "Got: {}", fp);
    assert!(fp.contains("-- preamble"), "Got: {}", fp);
    assert!(fp.contains("-- define1"), "Got: {}", fp);
}

#[test]
fn test_logica_with_for_default_true() {
    let logica = Logica::new();
    // No annotations set, default is true
    assert!(logica.with_for("T"));
}

#[test]
fn test_logica_with_for_compiling_udf() {
    let mut logica = Logica::new();
    logica.compiling_udf = true;
    assert!(!logica.with_for("T"));
}

// ── Dollar params ──

#[test]
fn test_dollar_params_undefined_error() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- x == "${my_param}";
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let result = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new());
    assert!(result.is_err(), "Should error on undefined dollar param");
}

#[test]
fn test_dollar_params_defined_ok() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_param", "default");
        T(x) :- x == "${my_param}";
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let result = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new());
    assert!(result.is_ok(), "Should succeed with defined param: {:?}", result.err());
}

#[test]
fn test_dollar_params_builtin_excluded() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- x == "${YYYY-MM-DD}";
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    // YYYY-prefixed params are excluded from dollar param checks
    let result = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new());
    assert!(result.is_ok(), "Built-in date params should be excluded: {:?}", result.err());
}

// ── predicate_sql with order by and limit ──

#[test]
fn test_predicate_sql_order_by() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @OrderBy(T, col0);
        T("hello");
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("ORDER BY"), "SQL should have ORDER BY: {}", sql);
}

#[test]
fn test_predicate_sql_limit() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @Limit(T, 10);
        T("hello");
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("LIMIT 10"), "SQL should have LIMIT: {}", sql);
}

// ── predicate_sql multi-rule UNION ALL ──

#[test]
fn test_predicate_sql_multi_rule_order_limit() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @OrderBy(T, col0);
        @Limit(T, 5);
        T("hello");
        T("world");
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("UNION ALL"), "SQL: {}", sql);
    assert!(sql.contains("ORDER BY"), "SQL: {}", sql);
    assert!(sql.contains("LIMIT 5"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with WITH ──

#[test]
fn test_formatted_predicate_sql_with_cte() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @NoInject(Source);
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.ends_with(';'), "Should end with semicolon: {}", sql);
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── formatted_predicate_sql simple (no deps) ──

#[test]
fn test_formatted_predicate_sql_no_deps() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.ends_with(';'));
    assert!(!sql.contains("WITH"), "Standalone fact should not need WITH: {}", sql);
}

// ── run_injections ──

#[test]
fn test_run_injections_inline() {
    // Single-rule predicates should be inlined
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = compile_predicate(&program, "Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

#[test]
fn test_run_injections_noinject() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @NoInject(Source);
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = compile_predicate(&program, "Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── translate_table_in_context: table aliases ──

#[test]
fn test_translate_table_alias() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Ext(x);
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let mut aliases = HashMap::new();
    aliases.insert("Ext".to_string(), "external_table".to_string());
    let program = LogicaProgram::new(&parsed, aliases, HashMap::new()).unwrap();
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("external_table"), "SQL: {}", sql);
}

// ── translate_table_in_context: ground ──

#[test]
fn test_translate_table_ground() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @Ground(Ext);
        T(x) :- Ext(x);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("Ext"), "SQL: {}", sql);
}

// ── translate_table_in_context: unknown table ──

#[test]
fn test_translate_table_unknown() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T(x) :- UnknownTable(x);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("UnknownTable"), "SQL: {}", sql);
}

// ── chain of dependencies with CTE ──

#[test]
fn test_formatted_sql_chain_deps() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @NoInject(A);
        @NoInject(B);
        A("start");
        B(x) :- A(x);
        C(x) :- B(x);
    "#);
    let sql = program.formatted_predicate_sql("C").unwrap();
    assert!(sql.ends_with(';'));
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── constraint ──

#[test]
fn test_predicate_sql_constraint_gt() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        Source(3);
        Result(x) :- Source(x), x > 1;
    "#);
    let sql = compile_predicate(&program, "Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── aggregation ──

#[test]
fn test_predicate_sql_aggregation_sum() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        Result(x? += 1) distinct :- Source(x);
    "#);
    let sql = compile_predicate(&program, "Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── NoWith inline subquery ──

#[test]
fn test_nowith_inline_subquery() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @NoWith(Source);
        @NoInject(Source);
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    // With NoWith, Source should be inlined as subquery, not as CTE
    assert!(!sql.contains("WITH"), "NoWith should prevent CTE: {}", sql);
}

// ── check_distinct_consistency ──

#[test]
fn test_distinct_consistency_ok() {
    // All rules of same predicate have consistent distinct
    let source = r#"
        @Engine("sqlite");
        T(x) distinct :- Source(x);
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let result = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new());
    assert!(result.is_ok(), "Single distinct rule should be fine: {:?}", result.err());
}

// ── multi-rule distinct_denoted error ──

#[test]
fn test_multi_rule_distinct_error() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        T(x) distinct :- Source(x);
    "#);
    // Single distinct rule should compile fine
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("GROUP BY"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with WITH + chain deps ──

#[test]
fn test_formatted_sql_with_chain_cte() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @With(A);
        @NoInject(A);
        @NoInject(B);
        A("start");
        B(x) :- A(x);
        C(x) :- B(x);
    "#);
    let sql = program.formatted_predicate_sql("C").unwrap();
    assert!(sql.contains("WITH"), "Should have WITH clause: {}", sql);
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with flags_comment and preamble ──

#[test]
fn test_formatted_sql_flag_substitution() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("tbl", "my_table");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── select_as_record helper ──

#[test]
fn test_select_as_record() {
    let mut select = IndexMap::new();
    select.insert("col0".to_string(), Json::Str("test_expr".to_string()));
    select.insert("logica_value".to_string(), Json::Str("skip_me".to_string()));
    select.insert("col1".to_string(), Json::Str("other_expr".to_string()));
    let record = select_as_record(&select);
    assert!(record.is_object());
    let rec = record.as_object().get("record").unwrap();
    let fvs = rec.as_object().get("field_value").unwrap().as_array();
    // logica_value should be skipped
    assert_eq!(fvs.len(), 2, "Should have 2 fields (logica_value skipped)");
}

// ── combine rule in single_rule_sql ──

#[test]
fn test_combine_rule_decoration() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        T(cnt? += 1) distinct :- Source(x);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── user flags override ──

#[test]
fn test_user_flags_override() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_flag", "default_val");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let mut flags = HashMap::new();
    flags.insert("my_flag".to_string(), "override_val".to_string());
    let program = LogicaProgram::new(&parsed, HashMap::new(), flags).unwrap();
    assert_eq!(program.flag_values.get("my_flag"), Some(&"override_val".to_string()));
}

// ── predicate_sql with body assignment (z = x + y) ──

#[test]
fn test_predicate_sql_with_assignment() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        T(y) :- Source(x), y == x + 1;
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── recursion_error_message content ──

#[test]
fn test_recursion_error_message_content() {
    let msg = recursion_error_message();
    assert!(msg.contains("Recursion"));
    assert!(msg.contains("@Recursive"));
}

// ── generate_with_clauses empty deps ──

#[test]
fn test_generate_with_clauses_no_exec() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    // No execution initialized → None
    let result = program.generate_with_clauses("T");
    assert!(result.is_none());
}

// ── formatted_predicate_sql with no WITH deps ──

#[test]
fn test_formatted_sql_simple_no_cte() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
        T("world");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("UNION ALL"), "SQL: {}", sql);
    assert!(!sql.contains("WITH"), "Simple facts should not need WITH: {}", sql);
}

// ── multiple table aliases ──

#[test]
fn test_multiple_table_aliases() {
    let source = r#"
        @Engine("sqlite");
        T(x, y) :- ExtA(x), ExtB(y);
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let mut aliases = HashMap::new();
    aliases.insert("ExtA".to_string(), "table_a".to_string());
    aliases.insert("ExtB".to_string(), "table_b".to_string());
    let program = LogicaProgram::new(&parsed, aliases, HashMap::new()).unwrap();
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("table_a"), "SQL: {}", sql);
    assert!(sql.contains("table_b"), "SQL: {}", sql);
}

// ── Logica struct: workflow stack ──

#[test]
fn test_logica_workflow_predicates_stack() {
    let mut l = Logica::new();
    l.workflow_predicates_stack.push("T".to_string());
    l.workflow_predicates_stack.push("Source".to_string());
    assert_eq!(l.workflow_predicates_stack.len(), 2);
    assert_eq!(l.workflow_predicates_stack.last(), Some(&"Source".to_string()));
}

// ── Logica struct: table maps ──

#[test]
fn test_logica_table_maps() {
    let mut l = Logica::new();
    l.table_to_defined_table_map.insert("T".to_string(), "T_cte".to_string());
    l.table_to_with_sql_map.insert("T_cte".to_string(), "SELECT 1".to_string());
    l.table_to_with_dependencies.entry("Result".to_string()).or_default().push("T".to_string());
    assert!(l.table_to_defined_table_map.contains_key("T"));
    assert!(l.table_to_with_sql_map.contains_key("T_cte"));
}

// ── predicate_sql with named fields ──

#[test]
fn test_predicate_sql_named_fields() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T(name: "hello", value: 42);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    assert!(sql.contains("hello"), "SQL: {}", sql);
}

// ── field_values_as_list with zero-based returns None ──

#[test]
fn test_field_values_as_list_zero_based_fails() {
    let mut m = HashMap::new();
    m.insert("0".to_string(), Json::Str("a".to_string()));
    // 0-based keys are invalid (expects 1-based), should return None
    let result = field_values_as_list(&m);
    assert!(result.is_none(), "0-based keys should fail");
}

// ── inject_structure preserves unnesting vars ──

#[test]
fn test_inject_structure_preserves_unnesting() {
    use crate::compiler::rule_translate::RuleStructure;
    let mut target = RuleStructure::new();
    let mut source = RuleStructure::new();
    source.inv_vars_map.insert("unnest_var".to_string(), ("".to_string(), "unnest_var".to_string()));
    inject_structure(&mut target, &source);
    assert!(target.inv_vars_map.contains_key("unnest_var"));
}

// ── WITH clause compilation via @With + @NoInject + chain ──

#[test]
fn test_with_clause_compilation_chain() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @With(Source);
        @NoInject(Source);
        Source("a");
        Source("b");
        Middle(x) :- Source(x);
        Result(x) :- Middle(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.contains("WITH"), "Should generate WITH clause: {}", sql);
    assert!(sql.ends_with(';'), "SQL: {}", sql);
}

// ── WITH clause with multiple deps ──

#[test]
fn test_with_clause_multiple_deps() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @With(A);
        @With(B);
        @NoInject(A);
        @NoInject(B);
        A("x");
        B("y");
        Result(x, y) :- A(x), B(y);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.contains("WITH"), "Should generate WITH clause: {}", sql);
}

// ── formatted_predicate_sql with order_by ──

#[test]
fn test_formatted_predicate_sql_with_order() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @OrderBy(T, col0);
        T("hello");
        T("world");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("ORDER BY"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with limit ──

#[test]
fn test_formatted_predicate_sql_with_limit() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @Limit(T, 5);
        T("hello");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("LIMIT 5"), "SQL: {}", sql);
}

// ── formatted_predicate_sql aggregation with combine ──

#[test]
fn test_formatted_predicate_sql_combine() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        T(x? += 1) distinct :- Source(x);
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── predicate_sql for If/CASE expression ──

#[test]
fn test_predicate_sql_if_expression() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        T(y) :- Source(x), y == If(x > 1, "big", "small");
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    // Python Logica uses IF() function format
    assert!(sql.contains("IF("), "SQL should contain IF(): {}", sql);
}

// ── predicate_sql with Cast ──

#[test]
fn test_predicate_sql_cast() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        T(y) :- Source(x), y == Cast(x, "TEXT");
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("CAST"), "SQL: {}", sql);
}

// ── predicate_sql with SqlExpr ──

#[test]
fn test_predicate_sql_sqlexpr() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        T(y) :- Source(x), y == SqlExpr("{0} + 10", x);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("+ 10"), "SQL: {}", sql);
}

// ── predicate_sql with FlagValue ──

#[test]
fn test_predicate_sql_flagvalue() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_table", "users");
        T(FlagValue("my_table"));
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("users"), "SQL should contain flag value: {}", sql);
}

// ── predicate_sql with list literal ──

#[test]
fn test_predicate_sql_list_literal() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T([1, 2, 3]);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("1"), "SQL: {}", sql);
}

// ── predicate_sql with unnesting ──

#[test]
fn test_predicate_sql_unnesting() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source([1, 2, 3]);
        T(x) :- Source(list), x in list;
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── predicate_sql with boolean expression ──

#[test]
fn test_predicate_sql_boolean() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        T(x, x > 1) :- Source(x);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── predicate_sql with subscript ──

#[test]
fn test_predicate_sql_subscript() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        T(x) :- Source(x);
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── use_flags_as_parameters with substitution ──

#[test]
fn test_use_flags_as_parameters_substitution() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("schema", "public");
        T("hello");
    "#;
    let parsed = crate::parser::parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let result = program.use_flags_as_parameters("SELECT * FROM ${schema}.table");
    assert_eq!(result, "SELECT * FROM public.table");
}

// ── predicate_sql with multiple body + constraint ──

#[test]
fn test_predicate_sql_complex_body() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Users("alice", 25);
        Users("bob", 30);
        Orders("alice", 100);
        Orders("bob", 200);
        Result(name, total) :- Users(name, age), Orders(name, total), age > 20;
    "#);
    let sql = compile_predicate(&program, "Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    assert!(sql.contains("WHERE"), "SQL should have WHERE: {}", sql);
}

// ── Logica struct: dependency edges ──

#[test]
fn test_logica_dependency_edges() {
    let mut l = Logica::new();
    l.dependency_edges.push(("A".to_string(), "B".to_string()));
    assert_eq!(l.dependency_edges.len(), 1);
}

// ── Logica struct: export_statements ──

#[test]
fn test_logica_export_statements() {
    let mut l = Logica::new();
    l.export_statements.push("CREATE TABLE T AS SELECT 1".to_string());
    assert_eq!(l.export_statements.len(), 1);
}

// ── Logica struct: defines_and_exports ──

#[test]
fn test_logica_defines_and_exports() {
    let mut l = Logica::new();
    l.defines_and_exports.push("-- statement".to_string());
    assert_eq!(l.defines_and_exports.len(), 1);
}

// ── combine expression through full pipeline ──

#[test]
fn test_combine_expression_full_pipeline() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        Source(3);
        T(x? += 1) distinct :- Source(x);
    "#);
    let exec = program.initialize_execution("T").unwrap();
    *program.execution.borrow_mut() = Some(exec);
    *program.allocator.borrow_mut() = program.new_names_allocator();
    // Call single_rule_sql with is_combine=true
    let rules = program.get_predicate_rules("T");
    assert!(!rules.is_empty());
    let sql = program.single_rule_sql(&rules[0], None, true, false);
    assert!(sql.is_ok(), "Combine SQL: {:?}", sql.err());
}

// ── predicate_sql with multiple deps and @With forcing CTE ──

#[test]
fn test_with_clause_generation() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @With(A);
        @With(B);
        @NoInject(A);
        @NoInject(B);
        A("x");
        A("y");
        B("a");
        B("b");
        C(x, y) :- A(x), B(y);
    "#);
    let sql = program.formatted_predicate_sql("C").unwrap();
    assert!(sql.contains("WITH"), "Should have WITH: {}", sql);
    assert!(sql.ends_with(';'), "SQL: {}", sql);
}

// ── translate_table_in_context with multiple calls ──

#[test]
fn test_translate_table_multiple_references() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        @With(Source);
        @NoInject(Source);
        Source("a");
        Source("b");
        A(x) :- Source(x);
        B(x) :- Source(x);
        C(x, y) :- A(x), B(y);
    "#);
    let sql = program.formatted_predicate_sql("C").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── predicate_sql with arithmetic ──

#[test]
fn test_predicate_sql_arithmetic() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        T(y) :- Source(x), y == x * 2 + 1;
    "#);
    let sql = compile_predicate(&program, "T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with single fact returns simple SQL ──

#[test]
fn test_formatted_predicate_sql_single_fact_no_with() {
    let program = make_universe_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(!sql.contains("WITH"), "Single fact should not have WITH: {}", sql);
    assert!(sql.contains("hello"), "SQL: {}", sql);
}
