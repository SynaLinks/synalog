// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

use super::*;

const ENGINES: &[&str] = &["sqlite", "duckdb", "psql", "mysql", "clickhouse", "trino", "presto", "databricks", "bigquery"];

fn ok(sql: &str, engine: &str) -> bool {
    writes_only_in_home([sql], engine)
}

/// `synalog_home` where `engine` keeps its tables.
fn home(engine: &str) -> &'static str {
    if matches!(engine, "trino" | "presto") { "synalog_home.synalog_home" } else { "synalog_home" }
}

#[test]
fn what_the_compiler_writes_is_accepted() {
    for engine in ENGINES {
        let h = home(engine);
        for sql in [
            "SELECT 1".to_string(),
            "-- Interacting with table x\nWITH a AS (SELECT 1 AS x) SELECT * FROM a".to_string(),
            format!("DROP TABLE IF EXISTS {h}.Q; CREATE TABLE {h}.Q AS SELECT t.update AS x, 'DROP TABLE orders' AS y FROM orders AS t"),
            format!("INSERT INTO {h}.Q_full SELECT * FROM {h}.Q_new"),
            format!("SELECT REPLACE(name, 'a', 'b') AS update FROM {h}.Q"),
            "(SELECT COUNT(*) FROM t)".to_string(),
        ] {
            assert!(ok(&sql, engine), "{engine}: {sql}");
        }
    }
    assert!(ok("create schema if not exists synalog_home; drop type if exists synalog_home.r cascade; create type synalog_home.r as struct(n numeric); create sequence if not exists synalog_home.s;", "duckdb"));
    assert!(ok("set client_min_messages to warning;\nDO $$ BEGIN if not exists (select 1 from pg_namespace where nspname = 'synalog_home') then create schema synalog_home; end if; END $$;", "psql"));
    assert!(ok("DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'r') then create type synalog_home.r as (nirvana numeric); end if; EXCEPTION WHEN read_only_sql_transaction OR insufficient_privilege THEN NULL; END $$;", "psql"));
    assert!(ok("DROP TABLE IF EXISTS pg_temp.R CASCADE; CREATE TABLE pg_temp.R AS SELECT 1 AS x", "psql"));
    assert!(ok("ATTACH DATABASE ':memory:' AS synalog_home", "sqlite"));
    assert!(ok("SET join_use_nulls = 1; CREATE DATABASE IF NOT EXISTS synalog_home; CREATE TABLE synalog_home.Q ENGINE = Memory AS SELECT 1", "clickhouse"));
    assert!(ok("SET SESSION sql_mode = 'ANSI_QUOTES'; CREATE DATABASE IF NOT EXISTS synalog_home DEFAULT COLLATE utf8mb4_0900_bin", "mysql"));
    assert!(ok("CREATE SCHEMA IF NOT EXISTS synalog_home.synalog_home", "trino"));
}

#[test]
fn a_write_anywhere_else_is_refused() {
    for engine in ENGINES {
        let h = home(engine);
        for sql in [
            "DROP TABLE orders".to_string(),
            "DROP TABLE IF EXISTS sales.orders".to_string(),
            "CREATE TABLE copy AS SELECT 1".to_string(),
            "CREATE TABLE sales.copy AS SELECT 1".to_string(),
            "INSERT INTO orders SELECT 1".to_string(),
            "DELETE FROM orders".to_string(),
            "UPDATE orders SET amount = 0".to_string(),
            "ALTER TABLE orders DROP COLUMN amount".to_string(),
            "TRUNCATE TABLE orders".to_string(),
            "MERGE INTO orders USING x ON 1 = 1 WHEN MATCHED THEN DELETE".to_string(),
            "GRANT SELECT ON orders TO public".to_string(),
            "CALL system.flush()".to_string(),
            "CREATE VIEW v AS SELECT 1".to_string(),
            "CREATE SCHEMA analytics".to_string(),
            "DROP SCHEMA synalog_home".to_string(),
            format!("CREATE TABLE {h} AS SELECT 1"),
            format!("CREATE TABLE {h}.a.b.c AS SELECT 1"),
            format!("CREATE TABLE \"{h}.Q\" AS SELECT 1"),
            format!("CREATE TABLE SYNALOG_HOME.Q AS SELECT 1"),
            format!("CREATE TABLE {h}.Q LOCATION 's3://bucket/q' AS SELECT 1"),
            format!("CREATE TABLE {h}.Q AS SELECT 1; DROP TABLE orders"),
            format!("SELECT 1; DROP TABLE orders"),
            format!("SELECT * INTO orders_copy FROM orders"),
            format!("WITH d AS (DELETE FROM orders RETURNING *) SELECT * FROM d"),
            format!("SELECT 1 /* unclosed"),
            format!("SELECT 'unclosed"),
            format!("CREATE TABLE (SELECT 1)"),
        ] {
            assert!(!ok(&sql, engine), "{engine}: {sql}");
        }
    }
    // Trino's and Presto's synalog_home.t is a schema of the customer's catalog.
    assert!(!ok("CREATE TABLE synalog_home.Q AS SELECT 1", "trino"));
    assert!(!ok("CREATE SCHEMA IF NOT EXISTS synalog_home", "presto"));
    // pg_temp is PostgreSQL's alone.
    assert!(!ok("CREATE TABLE pg_temp.R AS SELECT 1", "duckdb"));
    assert!(!ok("ATTACH DATABASE 'customer.db' AS synalog_home", "sqlite"));
    assert!(!ok("ATTACH DATABASE ':memory:' AS other", "sqlite"));
    assert!(!ok("CREATE TABLE synalog_home.Q ENGINE = URL('http://x') AS SELECT 1", "clickhouse"));
    assert!(!ok("SET ROLE admin", "psql"));
    assert!(!ok("DO $$ BEGIN EXECUTE 'DROP TABLE orders'; END $$", "psql"));
    assert!(!ok("DO $$ BEGIN DROP TABLE orders; END $$", "psql"));
    assert!(!ok("DO $$ BEGIN create schema analytics; END $$", "psql"));
}

#[test]
fn text_an_engine_reads_otherwise_is_refused() {
    // A literal's escapes, as the engine reads them: on ClickHouse, BigQuery
    // and Spark `\'` stays in the literal; elsewhere it ends it.
    assert!(ok("SELECT 'a\\'; DROP TABLE orders; --'", "clickhouse"));
    assert!(!ok("SELECT 'a\\'; DROP TABLE orders; --'", "duckdb"));
    assert!(ok("SELECT E'a\\'; DROP TABLE orders; --'", "psql"));
    assert!(!ok("SELECT 'a\\'; DROP TABLE orders; --'", "psql"));
    // On Spark and BigQuery a double-quoted text is a string.
    assert!(ok("SELECT \"; DROP TABLE orders; \"", "databricks"));
    assert!(ok("SELECT \"; DROP TABLE orders; \"", "bigquery"));
    // Elsewhere it is a name: one, whatever it holds.
    assert!(ok("SELECT \"; DROP TABLE orders; \"", "psql"));
    assert!(!ok("SELECT \"a\"; DROP TABLE orders", "psql"));
    // MySQL's `--` before no space is no comment, `/*!` runs, `#` comments.
    assert!(!ok("SELECT 1--1\n", "mysql"));
    assert!(!ok("SELECT /*! 1 */ 2", "mysql"));
    assert!(!ok("SELECT 1 # x", "mysql"));
    // A comment nested in a comment, as PostgreSQL reads it.
    assert!(!ok("/* /* */ ' */ DROP TABLE orders; -- '", "psql"));
    // Spark substitutes `${var}` before it reads a statement.
    assert!(!ok("SELECT ${x}", "databricks"));
    // BigQuery's raw and triple-quoted strings.
    assert!(!ok("SELECT r'a\\'", "bigquery"));
    assert!(!ok("SELECT '''a'b'''", "bigquery"));
}
