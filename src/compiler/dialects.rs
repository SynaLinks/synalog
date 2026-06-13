// Modified from: logica/compiler/dialects.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// License Apache 2.0: (c) 2025-2026 Yoan Sallami (Synalinks Team)

//! SQL dialects — port of Python's `compiler/dialects.py`.
//!
//! Each dialect defines built-in function templates, infix operator overrides,
//! subscript access, a Logica standard library program string, and various SQL
//! formatting helpers.

// NOTE: Python's DecorateCombineRule(rule, var) free function is implemented in
// rule_translate::decorate_combine_rule(). The boolean flag on the Dialect trait
// controls whether it's called from universe.rs during combine processing.

use std::collections::HashMap;
use crate::compiler::CompileError;

// ---------------------------------------------------------------------------
// GroupBySpec + Dialect trait
// ---------------------------------------------------------------------------

/// How GROUP BY references columns.
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum GroupBySpec {
    Name,
    Index,
    Expr,
}

/// Abstraction over SQL dialect differences.
pub trait Dialect {
    fn name(&self) -> &'static str;

    /// Additional built-in functions: Logica name → SQL template.
    /// Templates use `%s` for single-arg or `{0}`, `{1}` for multi-arg.
    fn built_in_functions(&self) -> HashMap<&'static str, &'static str>;

    /// Infix operator overrides: Logica operator → SQL template.
    fn infix_operators(&self) -> HashMap<&'static str, &'static str>;

    /// Field/subscript access on a record or table.
    fn subscript(&self, record: &str, subscript: &str, record_is_table: bool) -> String;

    /// Logica source code for the dialect's standard library.
    fn library_program(&self) -> &'static str;

    /// UNNEST phrase template with `{0}` for array, `{1}` for alias.
    fn unnest_phrase(&self) -> &'static str;

    /// Array literal construction template.
    fn array_phrase(&self) -> &'static str;

    /// How GROUP BY references columns.
    fn group_by_spec_by(&self) -> GroupBySpec;

    /// Format a predicate literal for SQL.
    fn predicate_literal(&self, name: &str) -> String {
        format!("'predicate_name:{}'", name)
    }

    /// Whether this dialect is PostgreSQL-compatible.
    fn is_postgresqlish(&self) -> bool {
        false
    }

    /// CASCADE keyword for DROP statements.
    fn cascading_deletion_word(&self) -> &'static str {
        ""
    }

    /// Whether table materialization uses `CREATE OR REPLACE TABLE` instead
    /// of `DROP TABLE IF EXISTS` + `CREATE TABLE`.
    fn supports_create_or_replace_table(&self) -> bool {
        false
    }

    /// SQL for an empty array literal.
    fn empty_array_literal(&self) -> String {
        let ap = self.array_phrase();
        if ap.contains("%s") {
            ap.replace("%s", "")
        } else if ap.is_empty() {
            "[]".to_string()
        } else {
            format!("{}()", ap)
        }
    }

    /// Record/struct construction SQL.
    fn record_literal(&self, fields: &[(&str, &str)]) -> String;

    /// String literal formatting.
    fn str_literal(&self, s: &str) -> String {
        let escaped = s.replace('\'', "''");
        format!("'{}'", escaped)
    }

    /// Whether combine rules should be decorated with MagicalEntangle.
    /// BigQuery, Trino, Presto, Databricks do NOT decorate;
    /// SQLite, DuckDB, PostgreSQL do.
    /// Whether combine rules should be decorated with MagicalEntangle.
    /// When true, `rule_translate::decorate_combine_rule()` performs the AST transformation.
    fn decorate_combine_rule(&self) -> bool {
        true
    }

    /// Generate a SQL condition that tests whether `column_expr` matches a regex `pattern`.
    /// Default uses REGEXP_LIKE (BigQuery, Trino, Presto, Databricks).
    fn regex_match_condition(&self, column_expr: &str, pattern: &str) -> String {
        let escaped = pattern.replace('\'', "''");
        format!("REGEXP_LIKE({}, '{}')", column_expr, escaped)
    }

    /// Cast an arbitrary expression to this dialect's string type, so the
    /// regex search can match any column. Mirrors the `ToString` cast target;
    /// the default is `TEXT` (sqlite, psql, duckdb).
    fn string_cast(&self, expr: &str) -> String {
        format!("CAST({} AS TEXT)", expr)
    }

    /// One-row relation backing the `Today` built-in concept: a `date` column
    /// holding the current date as a `YYYY-MM-DD` string. Inlined by the
    /// compiler so no runtime table is required.
    fn today_relation_sql(&self) -> String {
        "(SELECT CAST(CURRENT_DATE() AS STRING) AS date)".to_string()
    }

    /// One-row relation backing the `Now` built-in concept: a `timestamp`
    /// column holding the current instant as the dialect's native timestamp
    /// type (apply the `ToString`/`Substr` pipeline to read parts of it).
    fn now_relation_sql(&self) -> String {
        "(SELECT CURRENT_TIMESTAMP() AS timestamp)".to_string()
    }
}

/// SQL engines (dialects) supported by the compiler.
///
/// Single source of truth for valid engine names — keep in sync with the match
/// arms in [`get`].
pub const SUPPORTED_ENGINES: &[&str] = &[
    "bigquery", "sqlite", "psql", "trino", "presto", "databricks", "duckdb",
];

/// Get a dialect by engine name.
pub fn get(engine: &str) -> Result<Box<dyn Dialect>, CompileError> {
    match engine {
        "bigquery" => Ok(Box::new(BigQueryDialect)),
        "sqlite" => Ok(Box::new(SqLiteDialect)),
        "psql" => Ok(Box::new(PostgreSqlDialect)),
        "trino" => Ok(Box::new(TrinoDialect)),
        "presto" => Ok(Box::new(PrestoDialect)),
        "databricks" => Ok(Box::new(DatabricksDialect)),
        "duckdb" => Ok(Box::new(DuckDbDialect)),
        _ => Err(CompileError::new(
            format!(
                "Unsupported engine '{}'. Supported engines: {}.",
                engine,
                SUPPORTED_ENGINES.join(", ")
            ),
            "",
        )),
    }
}

// ---------------------------------------------------------------------------
// BigQuery
// ---------------------------------------------------------------------------

pub struct BigQueryDialect;

impl Dialect for BigQueryDialect {
    fn name(&self) -> &'static str { "bigquery" }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS STRING)", expr) }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        HashMap::new()
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "%s || %s");
        m
    }

    fn str_literal(&self, s: &str) -> String {
        // BigQuery uses double-quoted string literals (matching Python's json.dumps).
        let escaped = s.replace('\\', "\\\\").replace('"', "\\\"");
        format!("\"{}\"", escaped)
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, subscript)
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

# All ORDER BY arguments are wrapped, to avoid confusion with
# column index.
ArgMin(a) = SqlExpr("ARRAY_AGG({arg} order by [{value}][offset(0)] limit 1)[OFFSET(0)]",
                    {arg: a.arg, value: a.value});

ArgMax(a) = SqlExpr(
  "ARRAY_AGG({arg} order by  [{value}][offset(0)] desc limit 1)[OFFSET(0)]",
  {arg: a.arg, value: a.value});

ArgMaxK(a, l) = SqlExpr(
  "ARRAY_AGG({arg} order by  [{value}][offset(0)] desc limit {lim})",
  {arg: a.arg, value: a.value, lim: l});

ArgMinK(a, l) = SqlExpr(
  "ARRAY_AGG({arg} order by  [{value}][offset(0)] limit {lim})",
  {arg: a.arg, value: a.value, lim: l});

Array(a) = SqlExpr(
  "ARRAY_AGG({value} order by [{arg}][offset(0)])",
  {arg: a.arg, value: a.value});
"#
    }

    fn unnest_phrase(&self) -> &'static str { "UNNEST({0}) as {1}" }
    fn array_phrase(&self) -> &'static str { "ARRAY[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Name }

    fn predicate_literal(&self, name: &str) -> String {
        format!("STRUCT(\"{}\" AS predicate_name)", name)
    }

    fn record_literal(&self, fields: &[(&str, &str)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v)| format!("{} AS {}", v, k)).collect();
        format!("STRUCT({})", pairs.join(", "))
    }

    fn decorate_combine_rule(&self) -> bool { false }
}

// ---------------------------------------------------------------------------
// SqLite
// ---------------------------------------------------------------------------

pub struct SqLiteDialect;

impl Dialect for SqLiteDialect {
    fn name(&self) -> &'static str { "sqlite" }
    fn today_relation_sql(&self) -> String {
        "(SELECT date('now') AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT datetime('now') AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("Set", "DistinctListAgg({0})");
        m.insert("Element", "JSON_EXTRACT({0}, '$[' || {1} || ']')");
        m.insert("Range", "(select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < {0}) select n from t) where n < {0})");
        m.insert("ValueOfUnnested", "{0}.value");
        m.insert("List", "JSON_GROUP_ARRAY({0})");
        m.insert("Size", "JSON_ARRAY_LENGTH({0})");
        m.insert("Join", "JOIN_STRINGS({0}, {1})");
        m.insert("Count", "COUNT(DISTINCT {0})");
        m.insert("StringAgg", "GROUP_CONCAT(%s)");
        m.insert("Sort", "SortList({0})");
        m.insert("MagicalEntangle", "MagicalEntangle({0}, {1})");
        m.insert("Format", "Printf(%s)");
        m.insert("Least", "MIN(%s)");
        m.insert("Greatest", "MAX(%s)");
        m.insert("ToString", "CAST(%s AS TEXT)");
        m.insert("DateAddDay", "DATE({0}, {1} || ' days')");
        m.insert("DateDiffDay", "CAST(JULIANDAY({0}) - JULIANDAY({1}) AS INT64)");
        // SomeValue: match Python's ARRAY_AGG approach for SQLite
        m.insert("SomeValue", "ARRAY_AGG({0} IGNORE NULLS LIMIT 1)[OFFSET(0)]");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "(%s) || (%s)");
        m.insert("%", "(%s) % (%s)");
        m.insert("in", "IN_LIST(%s, %s)");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, record_is_table: bool) -> String {
        if record_is_table {
            format!("{}.{}", record, subscript)
        } else {
            format!("JSON_EXTRACT({}, \"$.{}\")", record, subscript)
        }
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

Arrow(left, right) = arrow :-
  left == arrow.arg,
  right == arrow.value;

PrintToConsole(message) :- 1 == SqlExpr("PrintToConsole({message})", {message:});

ArgMin(arr) = Element(
    SqlExpr("ArgMin({a}, {v}, 1)", {a:, v:}), 0) :- Arrow(a, v) == arr;

ArgMax(arr) = Element(
    SqlExpr("ArgMax({a}, {v}, 1)", {a:, v:}), 0) :- Arrow(a, v) == arr;

ArgMinK(arr, k) =
    SqlExpr("ArgMin({a}, {v}, {k})", {a:, v:, k:}) :-
  Arrow(a, v) == arr;

ArgMaxK(arr, k) =
    SqlExpr("ArgMax({a}, {v}, {k})", {a:, v:, k:}) :- Arrow(a, v) == arr;

Array(arr) =
    SqlExpr("ArgMin({v}, {a}, null)", {a:, v:}) :- Arrow(a, v) == arr;

ReadFile(filename) = SqlExpr("ReadFile({filename})", {filename:});

ReadJson(filename) = ReadFile(filename);

WriteFile(filename, content:) = SqlExpr("WriteFile({filename}, {content})",
                                        {filename:, content:});

Fingerprint(s) = SqlExpr("Fingerprint({s})", {s:});

Intelligence(command) = SqlExpr("Intelligence({command})", {command:});

RunClingo(script) = SqlExpr("RunClingo({script})", {script:});

RunClingoFile(filename) = SqlExpr("RunClingoFile({filename})", {filename:});

AssembleRecord(field_values) = SqlExpr("AssembleRecord({field_values})", {field_values:});

DisassembleRecord(record) = SqlExpr("DisassembleRecord({record})", {record:});

Char(code) = SqlExpr("CHAR({code})", {code:});
"#
    }

    fn unnest_phrase(&self) -> &'static str { "JSON_EACH({0}) as {1}" }
    fn array_phrase(&self) -> &'static str { "JSON_ARRAY(%s)" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Expr }

    fn record_literal(&self, fields: &[(&str, &str)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v)| format!("'{}', {}", k, v)).collect();
        format!("JSON_OBJECT({})", pairs.join(", "))
    }

    fn regex_match_condition(&self, column_expr: &str, pattern: &str) -> String {
        let escaped = pattern.replace('\'', "''");
        format!("{} REGEXP '{}'", column_expr, escaped)
    }
}

// ---------------------------------------------------------------------------
// PostgreSQL
// ---------------------------------------------------------------------------

pub struct PostgreSqlDialect;

impl Dialect for PostgreSqlDialect {
    fn name(&self) -> &'static str { "psql" }
    fn today_relation_sql(&self) -> String {
        "(SELECT to_char(current_date, 'YYYY-MM-DD') AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT current_timestamp AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("Range", "(SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, {0} - 1) as x)");
        m.insert("RangeOf", "(SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, ARRAY_LENGTH({0}, 1) - 1) as x)");
        m.insert("ToString", "CAST(%s AS TEXT)");
        m.insert("ToInt64", "CAST(%s AS BIGINT)");
        m.insert("ToFloat64", "CAST(%s AS double precision)");
        m.insert("Element", "({0})[{1} + 1]");
        m.insert("Size", "COALESCE(ARRAY_LENGTH({0}, 1), 0)");
        m.insert("Count", "COUNT(DISTINCT {0})");
        m.insert("MagicalEntangle", "(CASE WHEN {1} = 0 THEN {0} ELSE NULL END)");
        m.insert("ArrayConcat", "{0} || {1}");
        m.insert("Split", "STRING_TO_ARRAY({0}, {1})");
        m.insert("AnyValue", "(ARRAY_AGG(%s))[1]");
        m.insert("Log", "LN(%s)");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "%s || %s");
        m.insert("in", "%s = ANY(%s)");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("({}).{}", record, subscript)
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

ArgMin(a) = (SqlExpr("(ARRAY_AGG({arg} order by {value}))[1]",
                     {arg: {argpod: a.arg}, value: a.value})).argpod;

ArgMax(a) = (SqlExpr(
  "(ARRAY_AGG({arg} order by {value} desc))[1]",
  {arg: {argpod: a.arg}, value: a.value})).argpod;

ArgMaxK(a, l) = SqlExpr(
  "(ARRAY_AGG({arg} order by {value} desc))[1:{lim}]",
  {arg: a.arg, value: a.value, lim: l});

ArgMinK(a, l) = SqlExpr(
  "(ARRAY_AGG({arg} order by {value}))[1:{lim}]",
  {arg: a.arg, value: a.value, lim: l});

Array(a) = SqlExpr(
  "ARRAY_AGG({value} order by {arg})",
  {arg: a.arg, value: a.value});

RecordAsJson(r) = SqlExpr(
  "ROW_TO_JSON({r})", {r:});

Fingerprint(s) = SqlExpr("('x' || substr(md5({s}), 1, 16))::bit(64)::bigint", {s:});

ReadFile(filename) = SqlExpr("pg_read_file({filename})", {filename:});

Chr(x) = SqlExpr("Chr({x})", {x:});

Num(a) = a;
Str(a) = a;
"#
    }

    fn unnest_phrase(&self) -> &'static str { "UNNEST({0}) as {1}" }
    fn array_phrase(&self) -> &'static str { "ARRAY[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Expr }
    fn is_postgresqlish(&self) -> bool { true }
    fn cascading_deletion_word(&self) -> &'static str { " CASCADE" }

    /// `ARRAY[]` is untyped and rejected by PostgreSQL; upstream solves this
    /// with type inference (`ARRAY[]::text[]`), which synalog does not have at
    /// expression level yet. `'{}'` is an unknown-type literal that PostgreSQL
    /// coerces from context (CASE branches, function arguments, comparisons),
    /// which covers every place an empty array literal can usefully appear.
    fn empty_array_literal(&self) -> String {
        "'{}'".to_string()
    }

    fn record_literal(&self, fields: &[(&str, &str)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v)| format!("{} AS {}", v, k)).collect();
        format!("ROW({})", pairs.join(", "))
    }

    fn regex_match_condition(&self, column_expr: &str, pattern: &str) -> String {
        let escaped = pattern.replace('\'', "''");
        format!("{} ~ '{}'", column_expr, escaped)
    }
}

// ---------------------------------------------------------------------------
// Trino
// ---------------------------------------------------------------------------

pub struct TrinoDialect;

impl Dialect for TrinoDialect {
    fn name(&self) -> &'static str { "trino" }
    fn today_relation_sql(&self) -> String {
        "(SELECT CAST(current_date AS VARCHAR) AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT current_timestamp AS timestamp)".to_string()
    }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS VARCHAR)", expr) }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("Range", "SEQUENCE(0, %s - 1)");
        m.insert("ToString", "CAST(%s AS VARCHAR)");
        m.insert("ToInt64", "CAST(%s AS BIGINT)");
        m.insert("ToFloat64", "CAST(%s AS DOUBLE)");
        m.insert("AnyValue", "ARBITRARY(%s)");
        m.insert("ArrayConcat", "{0} || {1}");
        // Deviations from upstream Logica, which emits BigQuery-style
        // functions that do not exist on Trino (see
        // tests/compiler_tests/DEVIATIONS.md).
        m.insert("Size", "CARDINALITY({0})");
        m.insert("Log", "LN({0})");
        m.insert("Agg++", "FLATTEN(ARRAY_AGG({0}))");
        m.insert("Element", "ELEMENT_AT({0}, {1} + 1)");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "CONCAT(%s, %s)");
        // Deviation: upstream emits `x IN UNNEST(arr)` (BigQuery syntax).
        m.insert("in", "CONTAINS({1}, {0})");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, subscript)
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

ArgMin(a) = SqlExpr("(ARRAY_AGG({arg} order by {value}))[1]",
                    {arg: a.arg, value: a.value});

ArgMax(a) = SqlExpr(
  "(ARRAY_AGG({arg} order by {value} desc))[1]",
  {arg: a.arg, value: a.value});

ArgMaxK(a, l) = SqlExpr(
  "SLICE(ARRAY_AGG({arg} order by {value} desc), 1, {lim})",
  {arg: a.arg, value: a.value, lim: l});

ArgMinK(a, l) = SqlExpr(
  "SLICE(ARRAY_AGG({arg} order by {value}), 1, {lim})",
  {arg: a.arg, value: a.value, lim: l});

Array(a) = SqlExpr(
  "ARRAY_AGG({value} order by {arg})",
  {arg: a.arg, value: a.value});
"#
    }

    fn unnest_phrase(&self) -> &'static str { "UNNEST({0}) as pushkin({1})" }
    fn array_phrase(&self) -> &'static str { "ARRAY[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Index }
    fn decorate_combine_rule(&self) -> bool { false }

    fn record_literal(&self, fields: &[(&str, &str)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v)| format!("{} AS {}", v, k)).collect();
        format!("ROW({})", pairs.join(", "))
    }
}

// Presto
// ---------------------------------------------------------------------------

pub struct PrestoDialect;

impl Dialect for PrestoDialect {
    fn name(&self) -> &'static str { "presto" }
    fn today_relation_sql(&self) -> String {
        "(SELECT CAST(current_date AS VARCHAR) AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT current_timestamp AS timestamp)".to_string()
    }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS VARCHAR)", expr) }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("Range", "SEQUENCE(0, %s - 1)");
        m.insert("ToString", "CAST(%s AS VARCHAR)");
        m.insert("ToInt64", "CAST(%s AS BIGINT)");
        m.insert("ToFloat64", "CAST(%s AS DOUBLE)");
        m.insert("AnyValue", "ARBITRARY(%s)");
        // Deviations from upstream Logica, which emits BigQuery-style
        // functions that do not exist on PrestoDB (see
        // tests/compiler_tests/DEVIATIONS.md).
        m.insert("ArrayConcat", "{0} || {1}");
        m.insert("Size", "CARDINALITY({0})");
        m.insert("Log", "LN({0})");
        m.insert("Agg++", "FLATTEN(ARRAY_AGG({0}))");
        m.insert("Element", "ELEMENT_AT({0}, {1} + 1)");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "CONCAT(%s, %s)");
        // Deviation: upstream emits `x IN UNNEST(arr)` (BigQuery syntax).
        m.insert("in", "CONTAINS({1}, {0})");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, subscript)
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

ArgMin(a) = SqlExpr("(ARRAY_AGG({arg} order by {value}))[1]",
                    {arg: a.arg, value: a.value});

ArgMax(a) = SqlExpr(
  "(ARRAY_AGG({arg} order by {value} desc))[1]",
  {arg: a.arg, value: a.value});

ArgMaxK(a, l) = SqlExpr(
  "SLICE(ARRAY_AGG({arg} order by {value} desc), 1, {lim})",
  {arg: a.arg, value: a.value, lim: l});

ArgMinK(a, l) = SqlExpr(
  "SLICE(ARRAY_AGG({arg} order by {value}), 1, {lim})",
  {arg: a.arg, value: a.value, lim: l});

Array(a) = SqlExpr(
  "ARRAY_AGG({value} order by {arg})",
  {arg: a.arg, value: a.value});
"#
    }

    fn unnest_phrase(&self) -> &'static str { "UNNEST({0}) as pushkin({1})" }
    fn array_phrase(&self) -> &'static str { "ARRAY[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Index }
    fn decorate_combine_rule(&self) -> bool { false }

    fn record_literal(&self, fields: &[(&str, &str)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v)| format!("{} AS {}", v, k)).collect();
        format!("ROW({})", pairs.join(", "))
    }
}

// ---------------------------------------------------------------------------
// Databricks
// ---------------------------------------------------------------------------

pub struct DatabricksDialect;

impl Dialect for DatabricksDialect {
    fn name(&self) -> &'static str { "databricks" }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS STRING)", expr) }
    fn today_relation_sql(&self) -> String {
        "(SELECT CAST(current_date() AS STRING) AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT current_timestamp() AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("ToString", "CAST(%s AS STRING)");
        m.insert("ToInt64", "CAST(%s AS BIGINT)");
        m.insert("ToFloat64", "CAST(%s AS DOUBLE)");
        m.insert("AnyValue", "ANY_VALUE(%s)");
        // `::` cast is unavailable on Spark and superfluous on Databricks; CAST
        // is portable across both.
        m.insert("ILike", "(CAST({0} AS STRING) ILIKE {1})");
        m.insert("Like", "(CAST({0} AS STRING) LIKE {1})");
        m.insert("Replace", "REPLACE(CAST({0} AS STRING), {1}, {2})");
        // CONCAT concatenates arrays on Spark/Databricks; ARRAY_JOIN instead
        // stringifies an array with a delimiter (a different function).
        m.insert("ArrayConcat", "CONCAT({0}, {1})");
        m.insert("JsonExtract", "GET_JSON_OBJECT({0}, {1})");
        m.insert("JsonExtractScalar", "GET_JSON_OBJECT({0}, {1})");
        // Range/Size: the BigQuery defaults (GENERATE_ARRAY/ARRAY_LENGTH) do
        // not exist on Spark SQL; `Length` (string length) inherits the default
        // LENGTH — the previous ARRAY_SIZE override broke it for strings.
        m.insert("Range", "SEQUENCE(0, %s - 1)");
        m.insert("RangeOf", "SEQUENCE(0, SIZE(%s) - 1)");
        m.insert("Size", "SIZE(%s)");
        // ELEMENT_AT is 1-based; the default `{0}[OFFSET({1})]` is BigQuery-only.
        m.insert("Element", "ELEMENT_AT({0}, {1} + 1)");
        m.insert("Format", "FORMAT_STRING(%s)");
        m.insert("DateDiff", "DATEDIFF({0}, {1}, {2})");
        m.insert("IsNull", "({0} IS NULL)");
        m.insert("LogicalOr", "BOOL_OR(%s)");
        m.insert("LogicalAnd", "BOOL_AND(%s)");
        // `++=` array concat aggregation: BigQuery's ARRAY_CONCAT_AGG default is
        // absent on Spark SQL.
        m.insert("Agg++", "FLATTEN(COLLECT_LIST(%s))");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "CONCAT(%s, %s)");
        // ARRAY_CONTAINS(array, element): the membership operands arrive as
        // (element, array), so swap them.
        m.insert("in", "ARRAY_CONTAINS({1}, {0})");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, subscript)
    }

    fn library_program(&self) -> &'static str {
        // Spark/Databricks ARRAY_AGG (COLLECT_LIST) does not accept an
        // in-aggregate ORDER BY, so ordered aggregates are expressed by
        // collecting STRUCT(value, arg) pairs and sorting the array. Arrays are
        // 0-indexed via `[0]`.
        r#"
->(left:, right:) = {arg: left, value: right};
ArgMin(a) = SqlExpr(
  "SORT_ARRAY(COLLECT_LIST(STRUCT({value} AS value, {arg} AS arg)))[0].arg",
  {arg: a.arg, value: a.value});
ArgMax(a) = SqlExpr(
   "SORT_ARRAY(COLLECT_LIST(STRUCT({value} AS value, {arg} AS arg)), false)[0].arg",
  {arg: a.arg, value: a.value});
ArgMaxK(a, l) = SqlExpr(
  "TRANSFORM(SLICE(SORT_ARRAY(COLLECT_LIST(STRUCT({value} AS value, {arg} AS arg)), false), 1, {lim}), s -> s.arg)",
  {arg: a.arg, value: a.value, lim: l});
ArgMinK(a, l) = SqlExpr(
  "TRANSFORM(SLICE(SORT_ARRAY(COLLECT_LIST(STRUCT({value} AS value, {arg} AS arg))), 1, {lim}), s -> s.arg)",
  {arg: a.arg, value: a.value, lim: l});
RMatch(s, p) = SqlExpr(
  "REGEXP_LIKE({s}, {p})",
  {s: s, p: p});
RExtract(s, p, g) = SqlExpr(
  "REGEXP_SUBSTR({s}, {p}, 1, 1, 'c', {g})",
  {s: s, p: p, g: g});

Array(a) = SqlExpr(
  "TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT({arg} AS arg, {value} AS value))), s -> s.value)",
  {arg: a.arg, value: a.value});
"#
    }

    fn unnest_phrase(&self) -> &'static str { "explode({0}) AS pushkin({1})" }
    fn array_phrase(&self) -> &'static str { "ARRAY(%s)" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Index }
    fn decorate_combine_rule(&self) -> bool { false }

    fn record_literal(&self, fields: &[(&str, &str)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v)| format!("{} AS {}", v, k)).collect();
        format!("STRUCT({})", pairs.join(", "))
    }

    fn str_literal(&self, s: &str) -> String {
        let escaped = s.replace('\\', "\\\\").replace('"', "\\\"");
        format!("\"{}\"", escaped)
    }
}

// ---------------------------------------------------------------------------
// DuckDB
// ---------------------------------------------------------------------------

pub struct DuckDbDialect;

impl Dialect for DuckDbDialect {
    fn name(&self) -> &'static str { "duckdb" }

    fn supports_create_or_replace_table(&self) -> bool { true }

    fn today_relation_sql(&self) -> String {
        "(SELECT strftime(current_date, '%Y-%m-%d') AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT current_timestamp AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("Element", "array_extract({0},  CAST({1}+1 AS BIGINT))");
        m.insert("Range", "Range({0})");
        m.insert("ValueOfUnnested", "{0}.unnested_pod");
        m.insert("Size", "LEN({0})");
        m.insert("Join", "ARRAY_TO_STRING({0}, {1})");
        m.insert("Count", "COUNT(DISTINCT {0})");
        m.insert("StringAgg", "GROUP_CONCAT(%s)");
        m.insert("Sort", "SortList({0})");
        m.insert("MagicalEntangle", "(CASE WHEN {1} = 0 THEN {0} ELSE NULL END)");
        m.insert("Format", "Printf(%s)");
        m.insert("Least", "LEAST(%s)");
        m.insert("Greatest", "GREATEST(%s)");
        m.insert("ToString", "CAST(%s AS TEXT)");
        m.insert("ToFloat64", "CAST(%s AS DOUBLE)");
        m.insert("DateAddDay", "DATE({0}, {1} || ' days')");
        m.insert("DateDiffDay", "CAST(JULIANDAY({0}) - JULIANDAY({1}) AS INT64)");
        m.insert("CurrentTimestamp", "GET_CURRENT_TIMESTAMP()");
        m.insert("TimeAdd", "{0} + to_microseconds(cast(1000000 * {1} as int64))");
        m.insert("Rand", "RANDOM(%s)");
        m.insert("Log", "LN(%s)");
        m.insert("Set", "ARRAY_AGG(DISTINCT {0} ORDER BY {0})");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "(%s) || (%s)");
        m.insert("%", "(%s) % (%s)");
        m.insert("in", "list_contains({right}, {left})");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, subscript)
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

Arrow(left, right) = arrow :-
  left == arrow.arg,
  right == arrow.value;

PrintToConsole(message) :- 1 == SqlExpr("PrintToConsole({message})", {message:});

ArgMin(arr) = SqlExpr(
    "argmin({a}, {v})", {a: arr.arg, v: arr.value});

ArgMax(arr) = SqlExpr(
    "argmax({a}, {v})", {a: arr.arg, v: arr.value});

ArgMaxK(a, l) = SqlExpr(
  "(array_agg({arg_1} order by {value_1} desc))[1:{lim}]",
  {arg_1: a.arg, value_1: a.value, lim: l});

ArgMinK(a, l) = SqlExpr(
  "(array_agg({arg_1} order by {value_1}))[1:{lim}]",
  {arg_1: a.arg, value_1: a.value, lim: l});

Array(a) = SqlExpr(
  "ARRAY_AGG({value} order by {arg})",
  {arg: a.arg, value: a.value});

RecordAsJson(r) = SqlExpr(
  "ROW_TO_JSON({r})", {r:});

Fingerprint(s) = NaturalHash(s);

ReadFile(filename) = SqlExpr("(select struct_pack(size := any_value(size), content := any_value(content), filename := any_value(filename)) from read_text({filename}))", {filename:});

Chr(x) = SqlExpr("Chr(cast({x} as integer))", {x:});
Ord(x) = SqlExpr("Ord({x})", {x:});

Num(a) = a;
Str(a) = a;

Epoch(a) = epoch :-
  epoch = SqlExpr("epoch_ns({a})", {a:}) / 1000000000,
  a ~ Time,
  epoch ~ Num;
TimeDiffSeconds(a, b) = Epoch(SqlExpr("{a} - {b}", {a:, b:}));
ToTime(a) = SqlExpr("cast({a} as timestamp)", {a:});

NaturalHash(x) = ToInt64(SqlExpr("hash(cast({x} as string)) // cast(2 as ubigint)", {x:}));

# This is unsafe to use because due to the way Logica compiles this number
# will be unique for each use of the variable, which can be a pain to debug.
# It is OK to use it as long as you undertand and are OK with the difficulty.
UnsafeToUseUniqueNumber() = SqlExpr("nextval('eternal_logical_sequence')", {});

# Danger is immanent to life.
UniqueNumber() = SqlExpr("nextval('eternal_logical_sequence')", {});

# Aggregation that concatenates list.
# Doing via SqlExpr as Logica for now prohibits list of lists.
# TODO: We should allow list of lists in DuckDB.
MergeList(e) = SqlExpr("flatten(array_agg({e}))", {e:});

# Functional predicate for toy examples of solving
# NP-complete problems.
ProverChoice(slot, options:) = options[i] :-
  i = NaturalHash("ProverChoice-" ++
                  ToString(UniqueNumber())) % Size(options);

#######################
# Clingo support.
#

Clingo(p, m) = SqlExpr("Clingo({p}, {m})", {p:, m:}) :-
  m ~ [{predicate: Str, args: [Str]}];
CompileClingo(p, m) = SqlExpr("CompileClingo({p}, {m})", {p:, m:}) :-
  m ~ [{predicate: Str, args: [Str]}];

RunClingo(p) = SqlExpr("RunClingo({p})", {p:});
RunClingoFile(p) = SqlExpr("RunClingoFile({p})", {p:});
RunClingoTemplate(p, a) = SqlExpr("RunClingoTemplate({p}, {a})", {p:, a:});
RunClingoFileTemplate(p, a) = SqlExpr("RunClingoFileTemplate({p}, {a})", {p:, a:});

RenderClingoArgs(args) = (
  if Size(args) == 0 then
    "()"
  else
    "(" ++ Join(args, ", ") ++ ")"
);

RenderClingoFact(predicate, args) =  predicate ++ RenderClingoArgs(args);

QuoteIt(x) = Chr(34) ++ x ++ Chr(34);
ClingoFact(predicate, args) = {predicate:,
                               args: List{QuoteIt(a) :- a in args}};

ExtractClingoCall(a, b, c, d, e, f, g, h,
                  predicate:, model_id:) = models :-
  model in models,
  model_id = model.model_id,
  entry in model.model,
  entry.predicate = predicate,
  args = entry.args,
  a = args[0], b = args[1], c = args[2],
  d = args[3], e = args[4], f = args[5],
  g = args[6], h = args[7];

JoinOrEmpty(x, s) = Coalesce(Join(x, s), "");

RenderClingoModel(model, sep) = JoinOrEmpty(
    List{RenderClingoFact(fact.predicate, fact.args) :-
         fact in model}, sep);

# Indexed sum, that Clingo needs.
ISum(x) = SqlExpr("SUM({x})", {x:}) :- Error("ISum is to be used only in Clingo.") = true;
"#
    }

    fn unnest_phrase(&self) -> &'static str { "(select unnest({0}) as unnested_pod) as {1}" }
    fn array_phrase(&self) -> &'static str { "[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Expr }
    fn is_postgresqlish(&self) -> bool { true }

    fn record_literal(&self, fields: &[(&str, &str)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v)| format!("{}: {}", k, v)).collect();
        format!("{{{}}}", pairs.join(", "))
    }

    fn str_literal(&self, s: &str) -> String {
        // DuckDB uses E'...' escape-string literals (matches logica's DuckDB dialect).
        let escaped = s
            .replace('\\', "\\\\")
            .replace('\'', "''")
            .replace('\t', "\\t")
            .replace('\n', "\\n");
        format!("E'{}'", escaped)
    }

    fn regex_match_condition(&self, column_expr: &str, pattern: &str) -> String {
        let escaped = pattern.replace('\'', "''");
        format!("regexp_matches({}, '{}')", column_expr, escaped)
    }
}

#[cfg(test)]
#[path = "dialects_test.rs"]
mod dialects_test;
