// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use super::*;

// ── get() factory ──

#[test]
fn test_get_all_engines() {
    let engines = [
        "bigquery", "sqlite", "psql", "trino",
        "presto", "databricks", "duckdb",
    ];
    for engine in &engines {
        let d = get(engine).unwrap();
        assert_eq!(d.name(), *engine);
    }
}

#[test]
fn test_get_unknown_engine() {
    assert!(get("unknown_engine").is_err());
}

// ── library_program ──

#[test]
fn test_library_program_non_empty() {
    let engines = [
        "bigquery", "sqlite", "psql", "trino",
        "presto", "databricks", "duckdb",
    ];
    for engine in &engines {
        let d = get(engine).unwrap();
        let lib = d.library_program();
        assert!(!lib.is_empty(), "{} should have a library program", engine);
        assert!(
            lib.contains("->"),
            "{} library should define the arrow operator",
            engine
        );
    }
}

#[test]
fn test_library_program_parseable() {
    let engines = [
        "bigquery", "sqlite", "psql", "trino",
        "presto", "databricks", "duckdb",
    ];
    for engine in &engines {
        let d = get(engine).unwrap();
        let lib = d.library_program();
        let result = crate::parser::parse_file(lib, None, &[]);
        assert!(
            result.is_ok(),
            "{} library should parse without errors: {:?}",
            engine,
            result.err()
        );
    }
}

// ── decorate_combine_rule ──

#[test]
fn test_bigquery_no_decorate_combine() {
    let d = get("bigquery").unwrap();
    assert!(!d.decorate_combine_rule());
}

#[test]
fn test_sqlite_decorate_combine() {
    let d = get("sqlite").unwrap();
    assert!(d.decorate_combine_rule());
}

#[test]
fn test_trino_no_decorate_combine() {
    let d = get("trino").unwrap();
    assert!(!d.decorate_combine_rule());
}

#[test]
fn test_presto_no_decorate_combine() {
    let d = get("presto").unwrap();
    assert!(!d.decorate_combine_rule());
}

#[test]
fn test_databricks_no_decorate_combine() {
    let d = get("databricks").unwrap();
    assert!(!d.decorate_combine_rule());
}

#[test]
fn test_psql_decorate_combine() {
    // Default is true
    let d = get("psql").unwrap();
    assert!(d.decorate_combine_rule());
}

#[test]
fn test_duckdb_decorate_combine() {
    let d = get("duckdb").unwrap();
    assert!(d.decorate_combine_rule());
}

// ── is_postgresqlish ──

#[test]
fn test_duckdb_postgresqlish() {
    let d = get("duckdb").unwrap();
    assert!(d.is_postgresqlish());
}

#[test]
fn test_psql_postgresqlish() {
    let d = get("psql").unwrap();
    assert!(d.is_postgresqlish());
}

#[test]
fn test_bigquery_not_postgresqlish() {
    let d = get("bigquery").unwrap();
    assert!(!d.is_postgresqlish());
}

#[test]
fn test_sqlite_not_postgresqlish() {
    let d = get("sqlite").unwrap();
    assert!(!d.is_postgresqlish());
}

#[test]
fn test_trino_not_postgresqlish() {
    let d = get("trino").unwrap();
    assert!(!d.is_postgresqlish());
}

// ── cascading_deletion_word ──

#[test]
fn test_psql_cascading_deletion() {
    let d = get("psql").unwrap();
    assert_eq!(d.cascading_deletion_word(), " CASCADE");
}

#[test]
fn test_sqlite_no_cascading_deletion() {
    let d = get("sqlite").unwrap();
    assert_eq!(d.cascading_deletion_word(), "");
}

#[test]
fn test_bigquery_no_cascading_deletion() {
    let d = get("bigquery").unwrap();
    assert_eq!(d.cascading_deletion_word(), "");
}

// ── subscript ──

#[test]
fn test_sqlite_subscript_table() {
    let d = get("sqlite").unwrap();
    assert_eq!(d.subscript("t", "col", true), "t.col");
}

#[test]
fn test_sqlite_subscript_record() {
    let d = get("sqlite").unwrap();
    assert_eq!(d.subscript("r", "field", false), "JSON_EXTRACT(r, \"$.field\")");
}

#[test]
fn test_bigquery_subscript() {
    let d = get("bigquery").unwrap();
    assert_eq!(d.subscript("r", "field", true), "r.field");
    assert_eq!(d.subscript("r", "field", false), "r.field");
}

#[test]
fn test_psql_subscript() {
    let d = get("psql").unwrap();
    assert_eq!(d.subscript("r", "field", false), "(r).field");
}

#[test]
fn test_trino_subscript() {
    let d = get("trino").unwrap();
    assert_eq!(d.subscript("r", "field", false), "r.field");
}

#[test]
fn test_duckdb_subscript() {
    let d = get("duckdb").unwrap();
    assert_eq!(d.subscript("r", "field", true), "r.field");
    assert_eq!(d.subscript("r", "field", false), "r.field");
}

#[test]
fn test_presto_subscript() {
    let d = get("presto").unwrap();
    assert_eq!(d.subscript("r", "field", false), "r.field");
}

#[test]
fn test_databricks_subscript() {
    let d = get("databricks").unwrap();
    assert_eq!(d.subscript("r", "field", false), "r.field");
}

// ── group_by_spec ──

#[test]
fn test_group_by_specs() {
    assert_eq!(get("bigquery").unwrap().group_by_spec_by(), GroupBySpec::Name);
    assert_eq!(get("sqlite").unwrap().group_by_spec_by(), GroupBySpec::Expr);
    assert_eq!(get("trino").unwrap().group_by_spec_by(), GroupBySpec::Index);
    assert_eq!(get("presto").unwrap().group_by_spec_by(), GroupBySpec::Index);
    assert_eq!(get("databricks").unwrap().group_by_spec_by(), GroupBySpec::Index);
    assert_eq!(get("psql").unwrap().group_by_spec_by(), GroupBySpec::Expr);
    assert_eq!(get("duckdb").unwrap().group_by_spec_by(), GroupBySpec::Expr);
}

// ── record_literal ──

#[test]
fn test_record_literal_bigquery() {
    let d = get("bigquery").unwrap();
    let fields = [("a", "1"), ("b", "'x'")];
    assert_eq!(d.record_literal(&fields), "STRUCT(1 AS a, 'x' AS b)");
}

#[test]
fn test_record_literal_sqlite() {
    let d = get("sqlite").unwrap();
    let fields = [("a", "1"), ("b", "'x'")];
    assert_eq!(d.record_literal(&fields), "JSON_OBJECT('a', 1, 'b', 'x')");
}

#[test]
fn test_record_literal_duckdb() {
    let d = get("duckdb").unwrap();
    let fields = [("a", "1"), ("b", "'x'")];
    assert_eq!(d.record_literal(&fields), "{a: 1, b: 'x'}");
}

#[test]
fn test_record_literal_psql() {
    let d = get("psql").unwrap();
    let fields = [("a", "1"), ("b", "'x'")];
    assert_eq!(d.record_literal(&fields), "ROW(1 AS a, 'x' AS b)");
}

#[test]
fn test_record_literal_trino() {
    let d = get("trino").unwrap();
    let fields = [("a", "1")];
    assert_eq!(d.record_literal(&fields), "ROW(1 AS a)");
}

#[test]
fn test_record_literal_presto() {
    let d = get("presto").unwrap();
    let fields = [("a", "1")];
    assert_eq!(d.record_literal(&fields), "ROW(1 AS a)");
}

#[test]
fn test_record_literal_databricks() {
    let d = get("databricks").unwrap();
    let fields = [("a", "1")];
    assert_eq!(d.record_literal(&fields), "STRUCT(1 AS a)");
}

// ── unnest_phrase ──

#[test]
fn test_unnest_phrases() {
    assert_eq!(get("bigquery").unwrap().unnest_phrase(), "UNNEST({0}) as {1}");
    assert_eq!(get("sqlite").unwrap().unnest_phrase(), "JSON_EACH({0}) as {1}");
    assert_eq!(get("psql").unwrap().unnest_phrase(), "UNNEST({0}) as {1}");
    assert_eq!(get("trino").unwrap().unnest_phrase(), "UNNEST({0}) as pushkin({1})");
    assert_eq!(get("presto").unwrap().unnest_phrase(), "UNNEST({0}) as pushkin({1})");
    assert!(get("duckdb").unwrap().unnest_phrase().contains("unnest"));
    assert!(get("databricks").unwrap().unnest_phrase().contains("explode"));
}

// ── array_phrase ──

#[test]
fn test_array_phrases() {
    assert_eq!(get("bigquery").unwrap().array_phrase(), "ARRAY[%s]");
    assert_eq!(get("sqlite").unwrap().array_phrase(), "JSON_ARRAY(%s)");
    assert_eq!(get("psql").unwrap().array_phrase(), "ARRAY[%s]");
    assert_eq!(get("trino").unwrap().array_phrase(), "ARRAY[%s]");
    assert_eq!(get("presto").unwrap().array_phrase(), "ARRAY[%s]");
    assert_eq!(get("duckdb").unwrap().array_phrase(), "[%s]");
    assert_eq!(get("databricks").unwrap().array_phrase(), "ARRAY(%s)");
}

// ── predicate_literal ──

#[test]
fn test_predicate_literal_bigquery() {
    let d = get("bigquery").unwrap();
    assert_eq!(d.predicate_literal("Foo"), "STRUCT(\"Foo\" AS predicate_name)");
}

#[test]
fn test_predicate_literal_default() {
    // Default implementation wraps in single quotes
    let d = get("sqlite").unwrap();
    let result = d.predicate_literal("Foo");
    assert!(result.contains("Foo"), "Got: {}", result);
}

// ── str_literal ──

#[test]
fn test_str_literal_default() {
    let d = get("sqlite").unwrap();
    assert_eq!(d.str_literal("hello"), "'hello'");
}

#[test]
fn test_str_literal_escapes_quotes() {
    let d = get("duckdb").unwrap();
    // DuckDB uses E'...' escape-string literals (matches logica's DuckDB dialect).
    assert_eq!(d.str_literal("it's"), "E'it''s'");
}

#[test]
fn test_str_literal_default_escapes() {
    let d = get("bigquery").unwrap();
    // BigQuery uses double-quoted string literals (matching Python's json.dumps).
    assert_eq!(d.str_literal("it's"), "\"it's\"");
}

// ── built_in_functions ──

#[test]
fn test_sqlite_built_in_functions() {
    let d = get("sqlite").unwrap();
    let f = d.built_in_functions();
    assert!(f.contains_key("Format"), "SQLite should have Format");
    assert!(f.contains_key("Least"), "SQLite should have Least");
    assert!(f.contains_key("Greatest"), "SQLite should have Greatest");
    assert!(f.contains_key("DateAddDay"), "SQLite should have DateAddDay");
}

#[test]
fn test_psql_built_in_functions() {
    let d = get("psql").unwrap();
    let f = d.built_in_functions();
    assert!(f.contains_key("Log"), "psql should have Log");
    assert!(f.contains_key("Split"), "psql should have Split");
    assert!(f.contains_key("AnyValue"), "psql should have AnyValue");
}

#[test]
fn test_duckdb_built_in_functions() {
    let d = get("duckdb").unwrap();
    let f = d.built_in_functions();
    assert!(f.contains_key("Log"), "duckdb should have Log");
    assert!(f.contains_key("Rand"), "duckdb should have Rand");
    assert!(f.contains_key("Set"), "duckdb should have Set");
}

#[test]
fn test_bigquery_empty_built_in_functions() {
    let d = get("bigquery").unwrap();
    let f = d.built_in_functions();
    assert!(f.is_empty(), "BigQuery uses all base functions");
}

// ── infix_operators ──

#[test]
fn test_sqlite_infix_operators() {
    let d = get("sqlite").unwrap();
    let ops = d.infix_operators();
    assert!(ops.contains_key("++"), "SQLite should override ++");
    assert!(ops.contains_key("%"), "SQLite should override %");
    assert!(ops.contains_key("in"), "SQLite should override in");
}

#[test]
fn test_bigquery_infix_operators() {
    let d = get("bigquery").unwrap();
    let ops = d.infix_operators();
    assert!(ops.contains_key("++"), "BigQuery should override ++");
}

#[test]
fn test_duckdb_infix_operators() {
    let d = get("duckdb").unwrap();
    let ops = d.infix_operators();
    assert!(ops.contains_key("in"), "DuckDB should override in");
    assert!(ops["in"].contains("list_contains"), "DuckDB 'in' should use list_contains");
}

#[test]
fn test_psql_infix_operators() {
    let d = get("psql").unwrap();
    let ops = d.infix_operators();
    assert!(ops.contains_key("in"), "psql should override in");
    assert!(ops["in"].contains("ANY"), "psql 'in' should use ANY()");
}

// ── Presto ──

#[test]
fn test_presto_built_in_functions() {
    let d = get("presto").unwrap();
    let f = d.built_in_functions();
    assert!(f.contains_key("Range"), "presto should have Range");
    assert!(f.contains_key("ToString"), "presto should have ToString");
    assert!(f.contains_key("AnyValue"), "presto should have AnyValue");
}

#[test]
fn test_presto_infix_operators() {
    let d = get("presto").unwrap();
    let ops = d.infix_operators();
    assert!(ops.contains_key("++"), "Presto should have ++");
    assert!(ops["++"].contains("CONCAT"), "Presto ++ should use CONCAT");
}

#[test]
fn test_presto_library_parseable() {
    let d = get("presto").unwrap();
    let lib = d.library_program();
    assert!(!lib.is_empty());
    let result = crate::parser::parse_file(lib, None, &[]);
    assert!(result.is_ok(), "Presto library should parse: {:?}", result.err());
}

#[test]
fn test_presto_not_postgresqlish() {
    let d = get("presto").unwrap();
    assert!(!d.is_postgresqlish());
}

#[test]
fn test_presto_cascading_deletion() {
    let d = get("presto").unwrap();
    assert_eq!(d.cascading_deletion_word(), "");
}

// ── Databricks ──

#[test]
fn test_databricks_built_in_functions() {
    let d = get("databricks").unwrap();
    let f = d.built_in_functions();
    assert!(f.contains_key("ToString"), "databricks should have ToString");
    assert!(f.contains_key("ToInt64"), "databricks should have ToInt64");
    assert!(f.contains_key("AnyValue"), "databricks should have AnyValue");
    assert!(f.contains_key("ILike"), "databricks should have ILike");
    assert!(f.contains_key("IsNull"), "databricks should have IsNull");
    // Spark/Databricks-specific overrides of the BigQuery defaults.
    assert_eq!(f.get("Range"), Some(&"SEQUENCE(0, %s - 1)"));
    assert_eq!(f.get("Size"), Some(&"SIZE(%s)"));
    assert_eq!(f.get("Element"), Some(&"ELEMENT_AT({0}, {1} + 1)"));
    assert_eq!(f.get("Format"), Some(&"FORMAT_STRING(%s)"));
    assert_eq!(f.get("ArrayConcat"), Some(&"CONCAT({0}, {1})"));
    // `Length` (string length) is intentionally NOT overridden — it inherits
    // the default LENGTH; the old ARRAY_SIZE override was wrong for strings.
    assert!(!f.contains_key("Length"), "databricks must not override Length");
}

#[test]
fn test_databricks_infix_operators() {
    let d = get("databricks").unwrap();
    let ops = d.infix_operators();
    assert!(ops.contains_key("++"), "Databricks should have ++");
    assert!(ops.contains_key("in"), "Databricks should have in");
}

#[test]
fn test_databricks_library_parseable() {
    let d = get("databricks").unwrap();
    let lib = d.library_program();
    assert!(!lib.is_empty());
    let result = crate::parser::parse_file(lib, None, &[]);
    assert!(result.is_ok(), "Databricks library should parse: {:?}", result.err());
}

#[test]
fn test_databricks_not_postgresqlish() {
    let d = get("databricks").unwrap();
    assert!(!d.is_postgresqlish());
}

#[test]
fn test_databricks_cascading_deletion() {
    let d = get("databricks").unwrap();
    assert_eq!(d.cascading_deletion_word(), "");
}

// ── default trait method coverage ──

#[test]
fn test_default_predicate_literal() {
    // SQLite uses default predicate_literal
    let d = get("sqlite").unwrap();
    let result = d.predicate_literal("TestPred");
    assert!(result.contains("TestPred"), "Got: {}", result);
}

#[test]
fn test_default_str_literal_empty() {
    let d = get("sqlite").unwrap();
    assert_eq!(d.str_literal(""), "''");
}

#[test]
fn test_trino_cascading_deletion() {
    let d = get("trino").unwrap();
    assert_eq!(d.cascading_deletion_word(), "");
}

#[test]
fn test_duckdb_cascading_deletion() {
    let d = get("duckdb").unwrap();
    // DuckDB uses default (empty) cascading deletion
    assert_eq!(d.cascading_deletion_word(), "");
}

// ── regex_match_condition ──

#[test]
fn test_sqlite_regex_match_condition() {
    let d = get("sqlite").unwrap();
    assert_eq!(
        d.regex_match_condition("CAST(name AS TEXT)", "foo.*bar"),
        "CAST(name AS TEXT) REGEXP 'foo.*bar'"
    );
}

#[test]
fn test_psql_regex_match_condition() {
    let d = get("psql").unwrap();
    assert_eq!(
        d.regex_match_condition("CAST(name AS TEXT)", "foo.*bar"),
        "CAST(name AS TEXT) ~ 'foo.*bar'"
    );
}

#[test]
fn test_duckdb_regex_match_condition() {
    let d = get("duckdb").unwrap();
    assert_eq!(
        d.regex_match_condition("CAST(name AS TEXT)", "foo.*bar"),
        "regexp_matches(CAST(name AS TEXT), 'foo.*bar')"
    );
}

#[test]
fn test_bigquery_regex_match_condition() {
    let d = get("bigquery").unwrap();
    assert_eq!(
        d.regex_match_condition("CAST(name AS TEXT)", "foo.*bar"),
        "REGEXP_LIKE(CAST(name AS TEXT), 'foo.*bar')"
    );
}

#[test]
fn test_trino_regex_match_condition() {
    let d = get("trino").unwrap();
    assert_eq!(
        d.regex_match_condition("CAST(name AS TEXT)", "foo.*bar"),
        "REGEXP_LIKE(CAST(name AS TEXT), 'foo.*bar')"
    );
}

#[test]
fn test_presto_regex_match_condition() {
    let d = get("presto").unwrap();
    assert_eq!(
        d.regex_match_condition("CAST(name AS TEXT)", "foo.*bar"),
        "REGEXP_LIKE(CAST(name AS TEXT), 'foo.*bar')"
    );
}

#[test]
fn test_databricks_regex_match_condition() {
    let d = get("databricks").unwrap();
    assert_eq!(
        d.regex_match_condition("CAST(name AS TEXT)", "foo.*bar"),
        "REGEXP_LIKE(CAST(name AS TEXT), 'foo.*bar')"
    );
}

#[test]
fn test_regex_match_condition_escapes_single_quotes() {
    let engines = [
        "bigquery", "sqlite", "psql", "trino",
        "presto", "databricks", "duckdb",
    ];
    for engine in &engines {
        let d = get(engine).unwrap();
        let result = d.regex_match_condition("col", "it's");
        assert!(
            result.contains("it''s"),
            "{} should escape single quotes, got: {}",
            engine,
            result
        );
    }
}
