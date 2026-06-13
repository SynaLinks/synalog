//! Integration tests for the search feature (`formatted_predicate_sql_with_search`).
//!
//! Tests that a regex search filter is correctly applied per engine dialect.

use std::collections::HashMap;

use synalog::compiler::universe::{LogicaProgram, Pagination};
use synalog::parser::parse_file;

const ALL_ENGINES: &[&str] = &[
    "sqlite",
    "psql",
    "duckdb",
    "bigquery",
    "trino",
    "presto",
    "databricks",
];

/// Helper: compile a program in Logica mode and return search SQL for a predicate.
fn search_sql(source: &str, predicate: &str, pattern: &str) -> String {
    let parsed = parse_file(source, None, &[]).expect("parse should succeed");
    let program =
        LogicaProgram::new(&parsed, HashMap::new(), HashMap::new())
            .expect("compile should succeed");
    let pagination = Pagination {
        limit: None,
        offset: None,
    };
    program
        .formatted_predicate_sql_with_search(predicate, pattern, &pagination)
        .expect("search sql should succeed")
}

/// Helper: compile with pagination.
fn search_sql_with_pagination(
    source: &str,
    predicate: &str,
    pattern: &str,
    limit: Option<u64>,
    offset: Option<u64>,
) -> String {
    let parsed = parse_file(source, None, &[]).expect("parse should succeed");
    let program =
        LogicaProgram::new(&parsed, HashMap::new(), HashMap::new())
            .expect("compile should succeed");
    let pagination = Pagination { limit, offset };
    program
        .formatted_predicate_sql_with_search(predicate, pattern, &pagination)
        .expect("search sql should succeed")
}

/// Helper: attempt search and return Result.
fn search_sql_result(
    source: &str,
    predicate: &str,
    pattern: &str,
) -> Result<String, String> {
    let parsed = parse_file(source, None, &[]).expect("parse should succeed");
    let program =
        LogicaProgram::new(&parsed, HashMap::new(), HashMap::new())
            .expect("compile should succeed");
    let pagination = Pagination {
        limit: None,
        offset: None,
    };
    program
        .formatted_predicate_sql_with_search(predicate, pattern, &pagination)
        .map_err(|e| e.to_string())
}

// Programs that define facts (Logica mode) so they compile as self-contained queries.

fn program_for(engine: &str) -> String {
    format!(
        r#"
@Engine("{}");

Data(category: "A", value: 1);
Data(category: "B", value: 2);

@OrderBy(Test, "category");
Test(category:) distinct :- Data(category:);
"#,
        engine
    )
}

fn multi_col_program_for(engine: &str) -> String {
    format!(
        r#"
@Engine("{}");

Data(category: "A", value: 1);
Data(category: "B", value: 2);

@OrderBy(Test, "category");
Test(category:, value:) :- Data(category:, value:);
"#,
        engine
    )
}

// ---------------------------------------------------------------------------
// Engine-specific regex syntax
// ---------------------------------------------------------------------------

#[test]
fn search_sqlite_uses_regexp() {
    let sql = search_sql(&program_for("sqlite"), "Test", "ship.*");
    assert!(sql.contains("REGEXP"), "SQLite should use REGEXP, got:\n{}", sql);
}

#[test]
fn search_psql_uses_tilde() {
    let sql = search_sql(&program_for("psql"), "Test", "ship.*");
    assert!(sql.contains(" ~ "), "PostgreSQL should use ~ operator, got:\n{}", sql);
}

#[test]
fn search_duckdb_uses_regexp_matches() {
    let sql = search_sql(&program_for("duckdb"), "Test", "ship.*");
    assert!(sql.contains("regexp_matches("), "DuckDB should use regexp_matches(), got:\n{}", sql);
}

#[test]
fn search_bigquery_uses_regexp_like() {
    let sql = search_sql(&program_for("bigquery"), "Test", "ship.*");
    assert!(sql.contains("REGEXP_LIKE("), "BigQuery should use REGEXP_LIKE(), got:\n{}", sql);
}

#[test]
fn search_trino_uses_regexp_like() {
    let sql = search_sql(&program_for("trino"), "Test", "ship.*");
    assert!(sql.contains("REGEXP_LIKE("), "Trino should use REGEXP_LIKE(), got:\n{}", sql);
}

#[test]
fn search_presto_uses_regexp_like() {
    let sql = search_sql(&program_for("presto"), "Test", "ship.*");
    assert!(sql.contains("REGEXP_LIKE("), "Presto should use REGEXP_LIKE(), got:\n{}", sql);
}

#[test]
fn search_databricks_uses_regexp_like() {
    let sql = search_sql(&program_for("databricks"), "Test", "ship.*");
    assert!(sql.contains("REGEXP_LIKE("), "Databricks should use REGEXP_LIKE(), got:\n{}", sql);
}

// ---------------------------------------------------------------------------
// Pattern appears in SQL — all engines
// ---------------------------------------------------------------------------

#[test]
fn search_pattern_appears_in_sql_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql(&program_for(engine), "Test", "ship.*");
        assert!(
            sql.contains("ship.*"),
            "{}: pattern should appear in SQL, got:\n{}",
            engine,
            sql
        );
    }
}

// ---------------------------------------------------------------------------
// Subquery wrapping — all engines
// ---------------------------------------------------------------------------

#[test]
fn search_wraps_in_subquery_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql(&program_for(engine), "Test", "test");
        assert!(
            sql.contains("_searched"),
            "{}: should wrap in _searched subquery, got:\n{}",
            engine,
            sql
        );
        assert!(
            sql.contains("WHERE"),
            "{}: should have WHERE clause, got:\n{}",
            engine,
            sql
        );
    }
}

// ---------------------------------------------------------------------------
// Regression: the engine preamble (DDL) stays OUTSIDE the search wrapper
// ---------------------------------------------------------------------------

#[test]
fn search_keeps_preamble_outside_wrapper_duckdb() {
    // DuckDB emits setup DDL (create schema / type / sequence) as a preamble
    // before the query. A previous bug wrapped the *entire* formatted SQL —
    // preamble included — in `SELECT * FROM (...) AS _searched`, producing SQL
    // that fails to parse ("syntax error at or near create"). The preamble
    // must come before the search wrapper, not inside it.
    let sql = search_sql(&program_for("duckdb"), "Test", "A");
    let create = sql.find("create schema").expect("duckdb preamble present");
    let wrapper = sql.find("SELECT * FROM (").expect("search wrapper present");
    assert!(
        create < wrapper,
        "preamble must precede the search wrapper, got:\n{}",
        sql
    );
    // And the wrapped inner query must not contain the preamble DDL.
    let inner = &sql[wrapper..sql.find("AS _searched").unwrap()];
    assert!(
        !inner.contains("create schema"),
        "preamble leaked inside the _searched wrapper, got:\n{}",
        sql
    );
}

// ---------------------------------------------------------------------------
// Cast columns to TEXT — all engines
// ---------------------------------------------------------------------------

#[test]
fn search_casts_columns_to_text_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql(&program_for(engine), "Test", "test");
        assert!(
            sql.contains("CAST(category AS TEXT)"),
            "{}: should cast column to TEXT, got:\n{}",
            engine,
            sql
        );
    }
}

// ---------------------------------------------------------------------------
// Multiple columns — OR across all — all engines
// ---------------------------------------------------------------------------

#[test]
fn search_multiple_columns_uses_or_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql(&multi_col_program_for(engine), "Test", "test");
        assert!(
            sql.contains(" OR "),
            "{}: multiple columns should be joined with OR, got:\n{}",
            engine,
            sql
        );
        assert!(
            sql.contains("CAST(category AS TEXT)"),
            "{}: should cast category, got:\n{}",
            engine,
            sql
        );
        assert!(
            sql.contains("CAST(value AS TEXT)"),
            "{}: should cast value, got:\n{}",
            engine,
            sql
        );
    }
}

// ---------------------------------------------------------------------------
// Pagination — all engines
// ---------------------------------------------------------------------------

#[test]
fn search_with_limit_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql_with_pagination(
            &program_for(engine),
            "Test",
            "test",
            Some(10),
            None,
        );
        assert!(
            sql.contains("LIMIT 10"),
            "{}: should have LIMIT, got:\n{}",
            engine,
            sql
        );
    }
}

#[test]
fn search_with_offset_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql_with_pagination(
            &program_for(engine),
            "Test",
            "test",
            None,
            Some(5),
        );
        assert!(
            sql.contains("OFFSET 5"),
            "{}: should have OFFSET, got:\n{}",
            engine,
            sql
        );
    }
}

#[test]
fn search_with_limit_and_offset_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql_with_pagination(
            &program_for(engine),
            "Test",
            "test",
            Some(10),
            Some(5),
        );
        assert!(
            sql.contains("LIMIT 10"),
            "{}: should have LIMIT, got:\n{}",
            engine,
            sql
        );
        assert!(
            sql.contains("OFFSET 5"),
            "{}: should have OFFSET, got:\n{}",
            engine,
            sql
        );
    }
}

#[test]
fn search_without_pagination_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql_with_pagination(
            &program_for(engine),
            "Test",
            "test",
            None,
            None,
        );
        assert!(
            !sql.contains("LIMIT"),
            "{}: should not have LIMIT, got:\n{}",
            engine,
            sql
        );
        assert!(
            !sql.contains("OFFSET"),
            "{}: should not have OFFSET, got:\n{}",
            engine,
            sql
        );
    }
}

// ---------------------------------------------------------------------------
// Pattern escaping — all engines
// ---------------------------------------------------------------------------

#[test]
fn search_escapes_single_quotes_all_engines() {
    for engine in ALL_ENGINES {
        let sql = search_sql(&program_for(engine), "Test", "it's");
        assert!(
            sql.contains("it''s"),
            "{}: single quotes in pattern should be escaped, got:\n{}",
            engine,
            sql
        );
    }
}

// ---------------------------------------------------------------------------
// Error cases — all engines
// ---------------------------------------------------------------------------

#[test]
fn search_nonexistent_predicate_returns_error_all_engines() {
    for engine in ALL_ENGINES {
        let result = search_sql_result(&program_for(engine), "NonExistent", "test");
        assert!(
            result.is_err(),
            "{}: should error on nonexistent predicate",
            engine
        );
    }
}
