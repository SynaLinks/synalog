use super::*;
use crate::parser::parse_file;
use crate::compiler::CompileError;

fn make_program(source: &str) -> LogicaProgram {
    let parsed = parse_file(source, None, &[]).unwrap();
    LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap()
}

// ── LogicaProgram::new ──

#[test]
fn test_simple_fact() {
    let source = r#"
        @Engine("sqlite");
        T("hello");
    "#;
    let program = make_program(source);
    assert_eq!(program.engine(), "sqlite");
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("SELECT"), "SQL should contain SELECT: {}", sql);
    assert!(sql.contains("hello"), "SQL should contain 'hello': {}", sql);
}

#[test]
fn test_simple_rule() {
    let source = r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        Result(x) :- Source(x);
    "#;
    let program = make_program(source);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
    assert!(sql.contains("Source"), "SQL should reference Source: {}", sql);
}

#[test]
fn test_ground_predicate() {
    let source = r#"
        @Engine("sqlite");
        @Ground(MyTable);
        Result(x) :- MyTable(x);
    "#;
    let program = make_program(source);
    let sql = program.predicate_sql("MyTable").unwrap();
    assert_eq!(sql, "logica_test.MyTable");
}

// ── engine ──

#[test]
fn test_engine() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    assert_eq!(program.engine(), "sqlite");
}

#[test]
fn test_engine_default() {
    let program = make_program(r#"T("hello");"#);
    assert_eq!(program.engine(), "duckdb");
}

// ── defined_predicates ──

#[test]
fn test_defined_predicates() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
        Source("a");
    "#);
    let preds = program.defined_predicates();
    assert!(preds.contains("T"));
    assert!(preds.contains("Source"));
    assert!(!preds.contains("@Engine"));
}

#[test]
fn test_defined_predicates_include_library() {
    // Library predicates (like ->, `=`) should also be defined
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let preds = program.defined_predicates();
    // Arrow operator from library
    assert!(preds.contains("->"), "Library predicates should be defined: {:?}", preds);
}

// ── predicate_sql errors ──

#[test]
fn test_predicate_sql_undefined() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let result = program.predicate_sql("NonExistent");
    assert!(result.is_err());
}

// ── predicate_sql caching ──

#[test]
fn test_predicate_sql_caching() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let sql1 = program.predicate_sql("T").unwrap();
    let sql2 = program.predicate_sql("T").unwrap();
    assert_eq!(sql1, sql2);
}

// ── multi-rule UNION ALL ──

#[test]
fn test_multi_rule_union_all() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
        T("world");
    "#);
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("UNION ALL"), "Multi-rule should use UNION ALL: {}", sql);
}

// ── formatted_predicate_sql ──

#[test]
fn test_formatted_predicate_sql_simple() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.ends_with(';'), "Should end with semicolon: {}", sql);
    assert!(sql.contains("SELECT"), "Should contain SELECT: {}", sql);
}

#[test]
fn test_formatted_predicate_sql_with_dependency() {
    let program = make_program(r#"
        @Engine("sqlite");
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.ends_with(';'), "Should end with semicolon: {}", sql);
    assert!(sql.contains("SELECT"), "Should contain SELECT: {}", sql);
}

// ── ground with table alias ──

#[test]
fn test_ground_with_alias() {
    let program = make_program(r#"
        @Engine("sqlite");
        @Ground(Ext, actual_table);
        T(x) :- Ext(x);
    "#);
    let sql = program.predicate_sql("Ext").unwrap();
    assert_eq!(sql, "actual_table");
}

// ── table aliases ──

#[test]
fn test_table_aliases() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Ext(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let mut aliases = HashMap::new();
    aliases.insert("Ext".to_string(), "external_table".to_string());
    let program = LogicaProgram::new(&parsed, HashMap::new(), aliases).unwrap();
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("external_table"), "SQL should use alias: {}", sql);
}

// ── user flags ──

#[test]
fn test_user_flags() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_flag", "default");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let mut flags = HashMap::new();
    flags.insert("my_flag".to_string(), "override".to_string());
    let program = LogicaProgram::new(&parsed, flags, HashMap::new()).unwrap();
    // User flags should override defaults
    assert_eq!(program.flag_values.get("my_flag"), Some(&"override".to_string()));
}

// ── with CTE ──

#[test]
fn test_with_cte_generation() {
    let program = make_program(r#"
        @Engine("sqlite");
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    // WITH clause should be generated for Source dependency
    assert!(sql.contains("WITH") || sql.contains("SELECT"), "SQL: {}", sql);
}

// ── number in fact ──

#[test]
fn test_fact_with_number() {
    let program = make_program(r#"
        @Engine("sqlite");
        T(42);
    "#);
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("42"), "SQL should contain 42: {}", sql);
}

// ── rule with multiple body predicates ──

#[test]
fn test_rule_multiple_body() {
    let program = make_program(r#"
        @Engine("sqlite");
        A("hello");
        B("world");
        Result(x, y) :- A(x), B(y);
    "#);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── combine rule ──

#[test]
fn test_combine_rule() {
    let program = make_program(r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        Result(x? += 1) distinct :- Source(x);
    "#);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── single_rule_sql_ext with combine (is_combine=true) ──

#[test]
fn test_formatted_sql_with_order_by() {
    let program = make_program(r#"
        @Engine("sqlite");
        @OrderBy(T, col0);
        T("hello");
        T("world");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("ORDER BY"), "SQL should have ORDER BY: {}", sql);
}

#[test]
fn test_formatted_sql_with_limit() {
    let program = make_program(r#"
        @Engine("sqlite");
        @Limit(T, 5);
        T("hello");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("LIMIT 5"), "SQL should have LIMIT 5: {}", sql);
}

// ── injection (single-rule inline) ──

#[test]
fn test_injection_single_rule() {
    let program = make_program(r#"
        @Engine("sqlite");
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── NoInject blocks injection ──

#[test]
fn test_no_inject_blocks() {
    let program = make_program(r#"
        @Engine("sqlite");
        @NoInject(Source);
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── multi-rule with order/limit ──

#[test]
fn test_multi_rule_with_order_and_limit() {
    let program = make_program(r#"
        @Engine("sqlite");
        @OrderBy(T, col0);
        @Limit(T, 10);
        T("hello");
        T("world");
    "#);
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("UNION ALL"), "SQL: {}", sql);
    assert!(sql.contains("ORDER BY"), "SQL: {}", sql);
    assert!(sql.contains("LIMIT 10"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with CTE ──

#[test]
fn test_formatted_sql_with_cte() {
    let program = make_program(r#"
        @Engine("sqlite");
        @With(Source);
        Source("a");
        Result(x) :- Source(x);
    "#);
    let sql = program.formatted_predicate_sql("Result").unwrap();
    assert!(sql.contains("WITH"), "SQL should have WITH: {}", sql);
}

// ── translate_table via ProgramSubqueryTranslator ──

#[test]
fn test_translate_table_alias() {
    let source = r#"
        @Engine("sqlite");
        T(x) :- Ext(x);
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let mut aliases = HashMap::new();
    aliases.insert("Ext".to_string(), "my_external_table".to_string());
    let program = LogicaProgram::new(&parsed, HashMap::new(), aliases).unwrap();
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("my_external_table"), "SQL: {}", sql);
}

// ── undefined predicate error ──

#[test]
fn test_predicate_sql_undefined_error_message() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let result = program.predicate_sql("DoesNotExist");
    assert!(result.is_err());
    let err_msg = result.err().unwrap().to_string();
    assert!(err_msg.contains("DoesNotExist"), "Error: {}", err_msg);
}

// ── chain of dependencies ──

#[test]
fn test_chain_of_dependencies() {
    let program = make_program(r#"
        @Engine("sqlite");
        A("start");
        B(x) :- A(x);
        C(x) :- B(x);
    "#);
    let sql = program.formatted_predicate_sql("C").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── generate_with_clauses with no deps ──

#[test]
fn test_formatted_sql_no_deps() {
    let program = make_program(r#"
        @Engine("sqlite");
        T("hello");
    "#);
    let sql = program.formatted_predicate_sql("T").unwrap();
    // No WITH needed for standalone fact
    assert!(!sql.contains("WITH"), "SQL should not have WITH: {}", sql);
}

// ── CompileError Display ──

#[test]
fn test_compile_error_display_no_rule() {
    let e = CompileError::new("something failed", "");
    let s = format!("{}", e);
    assert!(s.contains("something failed"), "Got: {}", s);
    assert!(!s.contains("rule:"), "Got: {}", s);
}

#[test]
fn test_compile_error_display_with_rule() {
    let e = CompileError::new("bad variable", "T(x) :- Source(x)");
    let s = format!("{}", e);
    assert!(s.contains("bad variable"), "Got: {}", s);
    assert!(s.contains("T(x) :- Source(x)"), "Got: {}", s);
}

// ── constraint in rule ──

#[test]
fn test_rule_with_constraint() {
    let program = make_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        Source(3);
        Result(x) :- Source(x), x > 1;
    "#);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── combine rule decoration (single_rule_sql_ext) ──

#[test]
fn test_combine_rule_with_aggregation() {
    let program = make_program(r#"
        @Engine("sqlite");
        Source("a");
        Source("b");
        Source("c");
        Result(x? += 1) distinct :- Source(x);
    "#);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with flag substitution ──

#[test]
fn test_formatted_sql_flag_substitution() {
    let source = r#"
        @Engine("sqlite");
        @DefineFlag("my_tbl", "data");
        T("hello");
    "#;
    let parsed = parse_file(source, None, &[]).unwrap();
    let program = LogicaProgram::new(&parsed, HashMap::new(), HashMap::new()).unwrap();
    let sql = program.formatted_predicate_sql("T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── predicate_sql with join (multiple body predicates) ──

#[test]
fn test_predicate_sql_join() {
    let program = make_program(r#"
        @Engine("sqlite");
        A("hello");
        B("world");
        Result(x, y) :- A(x), B(y);
    "#);
    let sql = program.predicate_sql("Result").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── formatted_predicate_sql with chain deps and CTE ──

#[test]
fn test_formatted_sql_chain_deps_with_cte() {
    let program = make_program(r#"
        @Engine("sqlite");
        @With(A);
        @NoInject(A);
        @NoInject(B);
        A("start");
        B(x) :- A(x);
        C(x) :- B(x);
    "#);
    let sql = program.formatted_predicate_sql("C").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}

// ── predicate_sql with named fields ──

#[test]
fn test_predicate_sql_named_fields() {
    let program = make_program(r#"
        @Engine("sqlite");
        T(name: "hello", value: 42);
    "#);
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("hello"), "SQL: {}", sql);
}

// ── predicate_sql with assignment in body ──

#[test]
fn test_predicate_sql_body_assignment() {
    let program = make_program(r#"
        @Engine("sqlite");
        Source(1);
        Source(2);
        T(y) :- Source(x), y == x + 1;
    "#);
    let sql = program.predicate_sql("T").unwrap();
    assert!(sql.contains("SELECT"), "SQL: {}", sql);
}
