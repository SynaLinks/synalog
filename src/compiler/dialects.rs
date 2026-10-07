// Modified from: logica/compiler/dialects.py
// Original authors: Evgeny Skvortsov et al. (Logica Team, Google LLC)
// Original work: Copyright 2020 Google LLC, licensed under the Apache License, Version 2.0.
// Modifications: Copyright 2025-2026 Yoan Sallami (Synalinks Team), licensed under the Apache License, Version 2.0.

//! SQL dialects — port of Python's `compiler/dialects.py`.
//!
//! Each dialect defines built-in function templates, infix operator overrides,
//! subscript access, a Logica standard library program string, and various SQL
//! formatting helpers.

// NOTE: Python's DecorateCombineRule(rule, var) free function is implemented in
// rule_translate::decorate_combine_rule(). The boolean flag on the Dialect trait
// controls whether it's called from universe.rs during combine processing.

use std::collections::HashMap;
use std::collections::hash_map::DefaultHasher;
use std::hash::{Hash, Hasher};
use crate::compiler::CompileError;
use crate::compiler::type_inference::Type;

/// A double-quoted string literal for engines whose literals take backslash
/// escapes (Spark, BigQuery). A quote of the value is written `\u0022`, never
/// `\"`: the literal then holds no quote but its own two, so whatever splits a
/// script into statements at semicolons outside quotes, knowing these escapes
/// or not, never ends it early (`"\"; DROP TABLE t; --"` would end at the
/// escaped quote for one that does not, and run `DROP TABLE t`).
pub fn backslash_escaped_literal(s: &str) -> String {
    let escaped = s.replace('\\', "\\\\").replace('"', "\\u0022");
    format!("\"{}\"", escaped)
}

/// Deterministic composite-type name for a record shape.
///
/// Used by PostgreSQL, which (unlike trino/presto's inline `CAST(ROW … AS ROW(…))`)
/// can only expose *named* record fields through a declared composite type. The
/// name is content-addressed from the record's canonical shape (`Type`'s Display
/// sorts fields), so the `ROW(…)::name` literal and the `CREATE TYPE name …`
/// preamble agree without any shared state. Prefixed `logicarecord` so the
/// golden-test normalizer strips the generated DDL like the existing placeholder.
///
/// The name hashes the type's columns as declared (`psql_record_columns`), not
/// only its shape: a declaration is created once per database (`if not
/// exists`), so a type declared differently must have another name.
pub fn record_type_name(ty: &Type) -> String {
    let mut hasher = DefaultHasher::new();
    psql_record_columns(ty).hash(&mut hasher);
    format!("logicarecord{}", hasher.finish())
}

/// The columns of a record's PostgreSQL composite type, in canonical (sorted)
/// order, the order of the values of its `ROW(…)`: `"f" type, …`. A field of
/// a record has that record's composite type, a list of records an array of
/// it.
pub fn psql_record_columns(ty: &Type) -> String {
    fn column_type(t: &Type) -> String {
        match t {
            Type::Record { .. } => record_type_name(t),
            Type::List(inner) => format!("{}[]", column_type(inner)),
            Type::Number => "numeric".to_string(),
            Type::Bool => "boolean".to_string(),
            _ => "text".to_string(),
        }
    }
    let Type::Record { fields, .. } = ty else { return String::new() };
    let mut items: Vec<(&String, &Type)> = fields.iter().collect();
    items.sort_by(|a, b| a.0.cmp(b.0));
    items.iter()
        // Quoted, so a reserved word (`left`) is a field; a lowercase name
        // folds as an unquoted field access does.
        .map(|(k, t)| format!("\"{}\" {}", k, column_type(t)))
        .collect::<Vec<_>>()
        .join(", ")
}

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
/// SQL keywords no engine accepts as a bare identifier (the union of the
/// reserved words of the engines Synalog compiles to that a predicate or a
/// column name can plausibly collide with).
const SQL_KEYWORDS: &[&str] = &[
    "ALL", "ALTER", "AND", "ANY", "ARRAY", "AS", "ASC", "AT", "BETWEEN", "BOTH", "BY", "CASE", "CAST",
    "CHECK", "COLLATE", "COLUMN", "CONSTRAINT", "CREATE", "CROSS", "CURRENT_DATE", "CURRENT_TIME",
    "CURRENT_TIMESTAMP", "CURRENT_USER", "DEFAULT", "DELETE", "DESC", "DISTINCT", "DO", "DROP",
    "ELSE", "END", "EXCEPT", "EXISTS", "FALSE", "FETCH", "FOR", "FOREIGN", "FROM", "FULL", "GRANT",
    "GROUP", "GROUPING", "HAVING", "IN", "INNER", "INSERT", "INTERSECT", "INTERVAL", "INTO", "IS",
    "JOIN", "LATERAL", "LEADING", "LEFT", "LIKE", "LIMIT", "NATURAL", "NOT", "NULL", "OFFSET", "ON",
    "ONLY", "OR", "ORDER", "OUTER", "OVER", "PARTITION", "PRIMARY", "QUALIFY", "RANGE", "REFERENCES",
    "RIGHT", "ROW", "ROWS", "SELECT", "SESSION_USER", "SET", "SOME", "TABLE", "THEN", "TO",
    "TRAILING", "TRUE", "UNION", "UNIQUE", "UNNEST", "UPDATE", "USER", "USING", "VALUES", "WHEN",
    "WHERE", "WINDOW", "WITH",
    // Trino's and Presto's own.
    "CUBE", "CURRENT_CATALOG", "CURRENT_PATH", "CURRENT_ROLE", "CURRENT_SCHEMA", "DEALLOCATE",
    "DESCRIBE", "ESCAPE", "EXECUTE", "EXTRACT", "JSON_ARRAY", "JSON_EXISTS", "JSON_OBJECT",
    "JSON_QUERY", "JSON_TABLE", "JSON_VALUE", "LISTAGG", "LOCALTIME", "LOCALTIMESTAMP", "NORMALIZE",
    "PREPARE", "RECURSIVE", "ROLLUP", "SKIP", "TRIM", "UESCAPE",
    // PostgreSQL's own.
    "ANALYSE", "ANALYZE", "ASYMMETRIC", "DEFERRABLE", "INITIALLY", "PLACING", "RETURNING",
    "SYMMETRIC", "VARIADIC",
];

pub fn is_sql_keyword(name: &str) -> bool {
    SQL_KEYWORDS.iter().any(|k| k.eq_ignore_ascii_case(name))
}

/// A column name as SQL reads it: as is when it is a plain identifier, quoted
/// by the dialect when it is a keyword (`order`) or holds other characters.
pub fn sql_column(field: &str, dialect: &dyn Dialect) -> String {
    let plain = field.chars().next().is_some_and(|c| c.is_ascii_alphabetic() || c == '_')
        && field.chars().all(|c| c.is_ascii_alphanumeric() || c == '_');
    if plain && !is_sql_keyword(field) {
        field.to_string()
    } else {
        dialect.quote_identifier(field)
    }
}

pub trait Dialect {
    fn name(&self) -> &'static str;

    /// Additional built-in functions: Logica name → SQL template.
    /// Templates use `%s` for single-arg or `{0}`, `{1}` for multi-arg.
    fn built_in_functions(&self) -> HashMap<&'static str, &'static str>;

    /// Whether `Format(fmt, args…)` must be lowered to a string-concatenation
    /// chain because the engine has no printf-style function: PrestoDB 0.293
    /// registers neither `FORMAT` nor `printf`, PostgreSQL's `format` takes
    /// only `%s`, and Trino's needs an argument. Every other engine emits its
    /// native formatting function.
    fn format_uses_concat(&self) -> bool {
        false
    }

    /// Whether the engine sorts nulls first in this direction by default.
    /// Synalog sorts them last in both directions, which most engines do;
    /// `ORDER BY` says so where an engine would not.
    fn nulls_first_by_default(&self, _descending: bool) -> bool {
        false
    }

    /// `ToInt64` of an argument with no fraction by its form (text, a whole
    /// number written out), where the general `ToInt64` (which rounds a
    /// fraction) does not fit: SQLite before 3.46 has a fixed parser stack,
    /// which its nested conversions overflowed; DuckDB's ROUND takes no text;
    /// PostgreSQL's round goes through numeric. A template of `{0}`.
    fn int64_of_text(&self) -> Option<&'static str> {
        None
    }

    /// `ToString` of a number, the same text on every engine: a whole number
    /// without a decimal point (`5`), every digit below 10^18; any other
    /// number with at most 15 significant digits (what a double holds
    /// reliably) in plain decimal, trailing zeros trimmed (`0.1 + 0.2` is
    /// `0.3`), at most 15 decimals; the engine's own form from 10^38. Large
    /// numbers round in DECIMAL, where engines agree. The value is named
    /// once (a lambda's or a one-row subquery's `synalog_v`): written out at
    /// each use, nested conversions would grow exponentially. A template of
    /// `{0}`.
    fn number_to_string(&self) -> Option<&'static str> {
        None
    }

    /// An expression `{body}` of a value `{0}` named `synalog_v` once, so
    /// the value, an expression maybe, is written and computed once.
    fn bind_value(&self) -> &'static str {
        "(SELECT {body} FROM (SELECT {0} AS synalog_v) AS synalog_n)"
    }

    /// The least and greatest of booleans, where MIN and MAX take none
    /// (PostgreSQL): templates of `%s`.
    fn boolean_min_max(&self) -> Option<(&'static str, &'static str)> {
        None
    }

    /// Whether the engine's GREATEST and LEAST skip a null argument
    /// (PostgreSQL, DuckDB, Spark) instead of being null, as on BigQuery,
    /// SQLite, Trino and Presto.
    fn greatest_skips_nulls(&self) -> bool {
        false
    }

    /// The SQL type of a double.
    fn double_type(&self) -> &'static str {
        "DOUBLE"
    }

    /// The base-10 logarithm.
    fn log10_function(&self) -> &'static str {
        "LOG10"
    }

    /// The text of a boolean, where the engine has no boolean type and
    /// `ToString` would write 1 and 0 (SQLite): a template of `{0}`.
    fn boolean_to_string(&self) -> Option<&'static str> {
        None
    }

    /// Whether `OFFSET` can skip rows. PrestoDB disables it by default
    /// (`offset_clause_enabled`): a page past its first row is then taken
    /// by numbering the rows.
    fn supports_offset(&self) -> bool {
        true
    }

    /// The clause that takes a page of rows: `LIMIT` before `OFFSET`, as
    /// SQLite requires; Trino and Presto take `OFFSET` first.
    fn pagination_clause(&self, limit: Option<u64>, offset: Option<u64>) -> String {
        let mut clause = String::new();
        if let Some(limit) = limit {
            clause.push_str(&format!("\nLIMIT {}", limit));
        }
        if let Some(offset) = offset {
            clause.push_str(&format!("\nOFFSET {}", offset));
        }
        clause
    }

    /// Infix operator overrides: Logica operator → SQL template.
    fn infix_operators(&self) -> HashMap<&'static str, &'static str>;

    /// Field/subscript access on a record or table.
    fn subscript(&self, record: &str, subscript: &str, record_is_table: bool) -> String;

    /// A record's field name as the dialect writes it in a record literal, a
    /// row type and a field access: quoted when it is a keyword (`inner`) or
    /// not a plain identifier, like a column.
    fn record_field(&self, name: &str) -> String {
        let plain = name.chars().next().is_some_and(|c| c.is_ascii_alphabetic() || c == '_')
            && name.chars().all(|c| c.is_ascii_alphanumeric() || c == '_');
        if name == "*" || (plain && !is_sql_keyword(name)) {
            name.to_string()
        } else {
            self.quote_identifier(name)
        }
    }

    /// Logica source code for the dialect's standard library.
    fn library_program(&self) -> &'static str;

    /// UNNEST phrase template with `{0}` for array, `{1}` for alias.
    fn unnest_phrase(&self) -> &'static str;

    /// `unnest_phrase` for an array of records, whose element must stay one
    /// value (PostgreSQL spreads a composite into a column per field).
    fn unnest_records_phrase(&self) -> &'static str {
        self.unnest_phrase()
    }

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

    /// A number written with a decimal point (`1.5`), which is a float.
    fn float_literal(&self, text: &str) -> String {
        text.to_string()
    }

    /// The set difference of two queries' rows.
    fn except_distinct(&self) -> &'static str {
        "EXCEPT"
    }

    /// `name` quoted as an identifier (standard SQL: double quotes).
    fn quote_identifier(&self, name: &str) -> String {
        format!("\"{}\"", name.replace('"', "\"\""))
    }

    /// Whether table materialization uses `CREATE OR REPLACE TABLE` instead
    /// of `DROP TABLE IF EXISTS` + `CREATE TABLE`.
    fn supports_create_or_replace_table(&self) -> bool {
        false
    }

    /// `array` (an empty array or a null) typed as an array of `element`,
    /// when the dialect writes one.
    fn typed_array(&self, _array: &str, _element: &Type) -> Option<String> {
        None
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

    /// Record/struct construction SQL. Each field is `(name, value_sql, type)`;
    /// the type lets typed dialects (trino/presto `CAST(ROW … AS ROW(…))`, psql
    /// composite types) declare field types. Dialects with self-describing
    /// struct literals ignore it.
    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String;

    /// SQL type name for an atomic (non-record) value, used when building typed
    /// record literals. The default suits ANSI-ish engines (trino/presto);
    /// PostgreSQL overrides with its own spellings.
    fn scalar_sql_type(&self, ty: &Type) -> String {
        match ty {
            Type::Number => "double".to_string(),
            Type::Bool => "boolean".to_string(),
            Type::List(inner) => format!("array({})", self.scalar_sql_type(inner)),
            _ => "varchar".to_string(),
        }
    }

    /// Inline SQL type for a record field, recursing into nested records as
    /// `ROW(field type, …)` (trino/presto). Fields are emitted in canonical
    /// (sorted) order so the type matches the value emitted by `record_literal`.
    fn row_field_type(&self, ty: &Type) -> String {
        match ty {
            Type::List(inner) if matches!(**inner, Type::Record { .. } | Type::List(_)) => {
                format!("array({})", self.row_field_type(inner))
            }
            Type::Record { fields, .. } => {
                let mut items: Vec<(&String, &Type)> = fields.iter().collect();
                items.sort_by(|a, b| a.0.cmp(b.0));
                let parts: Vec<String> = items
                    .iter()
                    .map(|(k, t)| format!("{} {}", self.record_field(k), self.row_field_type(t)))
                    .collect();
                format!("ROW({})", parts.join(", "))
            }
            _ => self.scalar_sql_type(ty),
        }
    }

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
        // The pattern is a string literal like any other: the dialect's own
        // escapes (a backslash ends a literal on Spark and BigQuery otherwise).
        format!("REGEXP_LIKE({}, {})", column_expr, self.str_literal(pattern))
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
    fn bind_value(&self) -> &'static str { "(SELECT {body} FROM UNNEST([{0}]) AS synalog_v)" }
    fn double_type(&self) -> &'static str { "FLOAT64" }
    fn number_to_string(&self) -> Option<&'static str> {
        Some("(SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INT64) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) ELSE CAST(ROUND(CAST(synalog_v AS BIGNUMERIC), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT64)) AS STRING) END) FROM UNNEST([{0}]) AS synalog_v)")
    }
    fn nulls_first_by_default(&self, descending: bool) -> bool { !descending }
    fn except_distinct(&self) -> &'static str {
        "EXCEPT DISTINCT"
    }

    fn quote_identifier(&self, name: &str) -> String {
        // Double quotes make a string here: identifiers take backticks,
        // with a string's backslash escapes.
        format!("`{}`", name.replace('\\', "\\\\").replace('`', "\\`"))
    }

    fn name(&self) -> &'static str { "bigquery" }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS STRING)", expr) }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("RegexpContains", "REGEXP_CONTAINS({0}, {1})");
        m.insert("Div", "CAST((CASE WHEN (({0}) < 0) <> (({1}) < 0) THEN CEIL(CAST({0} AS FLOAT64) / NULLIF({1}, 0)) ELSE FLOOR(CAST({0} AS FLOAT64) / NULLIF({1}, 0)) END) AS INT64)");
        // LIKE has no ESCAPE clause here: a backslash escapes already.
        m.insert("Like", "({0} LIKE {1})");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("++", "%s || %s");
        m
    }

    fn str_literal(&self, s: &str) -> String {
        // BigQuery uses double-quoted string literals (matching Python's json.dumps).
        backslash_escaped_literal(s)
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, self.record_field(subscript))
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

    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v, _)| format!("{} AS {}", v, self.record_field(k))).collect();
        format!("STRUCT({})", pairs.join(", "))
    }

    fn decorate_combine_rule(&self) -> bool { false }
}

// ---------------------------------------------------------------------------
// SqLite
// ---------------------------------------------------------------------------

pub struct SqLiteDialect;

impl Dialect for SqLiteDialect {
    fn bind_value(&self) -> &'static str { "(SELECT {body} FROM (SELECT {0} AS synalog_v))" }
    fn double_type(&self) -> &'static str { "REAL" }
    fn number_to_string(&self) -> Option<&'static str> {
        // The text of a number nests as little as it can: SQLite before 3.46 parses
        // about 30 nested calls at most ("parser stack overflow"), and the
        // number's text often sits inside other calls.
        Some("(SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, substr(printf('%.14e', abs(synalog_v)), 19) - 14) ELSE rtrim(rtrim(printf('%.*f', min(15, max(1, 14 - floor(log10(abs(synalog_v))))), synalog_v), '0'), '.') END) FROM (SELECT {0} AS synalog_v))")
    }
    fn int64_of_text(&self) -> Option<&'static str> {
        Some("CAST({0} AS INTEGER)")
    }
    fn boolean_to_string(&self) -> Option<&'static str> {
        Some("(CASE {0} WHEN 1 THEN 'true' WHEN 0 THEN 'false' END)")
    }
    fn nulls_first_by_default(&self, descending: bool) -> bool { !descending }
    fn name(&self) -> &'static str { "sqlite" }
    fn today_relation_sql(&self) -> String {
        "(SELECT date('now') AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT datetime('now') AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("Strpos", "INSTR({0}, {1})");
        m.insert("Lpad", "(CASE WHEN LENGTH({0}) >= {1} THEN SUBSTR({0}, 1, {1}) ELSE SUBSTR(REPLACE(HEX(ZEROBLOB({1})), '00', {2}), 1, {1} - LENGTH({0})) || {0} END)");
        m.insert("Rpad", "(CASE WHEN LENGTH({0}) >= {1} THEN SUBSTR({0}, 1, {1}) ELSE {0} || SUBSTR(REPLACE(HEX(ZEROBLOB({1})), '00', {2}), 1, {1} - LENGTH({0})) END)");
        m.insert("Repeat", "(CASE WHEN {0} IS NULL OR {1} IS NULL THEN NULL ELSE REPLACE(HEX(ZEROBLOB({1})), '00', {0}) END)");
        // SQLite has no REVERSE: the characters taken from the last.
        m.insert("Reverse", "(WITH RECURSIVE synalog_r(i, t) AS (SELECT LENGTH({0}), '' UNION ALL SELECT i - 1, t || SUBSTR({0}, i, 1) FROM synalog_r WHERE i > 0) SELECT t FROM synalog_r WHERE i = 0)");
        // REGEXP of a null is false here; a null is null on every engine.
        m.insert("RegexpContains", "(CASE WHEN {0} IS NULL OR {1} IS NULL THEN NULL ELSE {0} REGEXP {1} END)");
        m.insert("Div", "CAST((CASE WHEN (({0}) < 0) <> (({1}) < 0) THEN CEIL(CAST({0} AS REAL) / NULLIF({1}, 0)) ELSE FLOOR(CAST({0} AS REAL) / NULLIF({1}, 0)) END) AS INTEGER)");
        // SQLite's CAST truncates a fraction; the other engines round it (half
        // away from zero). Only a float is rounded: an integer goes through
        // as it is, without passing through a double.
        m.insert(
            "ToInt64",
            // The value is named once: written three times, nested calls
            // grow exponentially (SQLite's parser overflows).
            "(SELECT CASE WHEN typeof(v) = 'real' THEN CAST(ROUND(v) AS INTEGER) ELSE CAST(v AS INTEGER) END FROM (SELECT {0} AS v))",
        );
        m.insert("Set", "DistinctListAgg({0})");
        m.insert("Element", "(CASE WHEN {1} < 0 THEN NULL ELSE JSON_EXTRACT({0}, '$[' || {1} || ']') END)");
        m.insert("Range", "(select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < {0}) select n from t) where n < {0})");
        m.insert("ValueOfUnnested", "{0}.value");
        // A list of no rows is null, as ARRAY_AGG's is on the other engines.
        m.insert("List", "(CASE WHEN COUNT(*) = 0 THEN NULL ELSE JSON_GROUP_ARRAY({0}) END)");
        m.insert("Size", "JSON_ARRAY_LENGTH({0})");
        // In SQL, as on the other engines: the elements in order, nulls
        // skipped, empty text for an empty list.
        m.insert("Join", "(CASE WHEN {0} IS NULL OR {1} IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(value, {1}) FROM (SELECT value FROM JSON_EACH({0}) WHERE value IS NOT NULL ORDER BY key)), '') END)");
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
        // `/` divides exactly, as BigQuery, DuckDB and Spark do: this engine
        // divides integers to an integer (7 / 2 = 3).
        m.insert("/", "CAST(%s AS REAL) / NULLIF(%s, 0)");
        m.insert("++", "(%s) || (%s)");
        // `%` truncates both sides to integers here (7.5 % 2 is 1): the
        // remainder of the quotient truncated toward zero, which keeps an
        // integer an integer.
        m.insert("%", "(({0}) - ({1}) * CAST(({0}) / NULLIF({1}, 0) AS INTEGER))");
        m.insert("in", "IN_LIST(%s, %s)");
        m
    }

    fn record_field(&self, name: &str) -> String {
        // A record is a JSON object: its field names are keys, never quoted.
        name.to_string()
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

Fingerprint(s) = SqlExpr("Fingerprint({s})", {s:});

AssembleRecord(field_values) = SqlExpr("AssembleRecord({field_values})", {field_values:});

DisassembleRecord(record) = SqlExpr("DisassembleRecord({record})", {record:});

Char(code) = SqlExpr("CHAR({code})", {code:});
"#
    }

    fn unnest_phrase(&self) -> &'static str { "JSON_EACH({0}) as {1}" }
    fn array_phrase(&self) -> &'static str { "JSON_ARRAY(%s)" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Expr }

    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v, _)| format!("'{}', {}", k, v)).collect();
        format!("JSON_OBJECT({})", pairs.join(", "))
    }

    fn regex_match_condition(&self, column_expr: &str, pattern: &str) -> String {
        // The pattern is a string literal like any other: the dialect's own
        // escapes (a backslash ends a literal on Spark and BigQuery otherwise).
        format!("{} REGEXP {}", column_expr, self.str_literal(pattern))
    }
}

// ---------------------------------------------------------------------------
// PostgreSQL
// ---------------------------------------------------------------------------

pub struct PostgreSqlDialect;

impl Dialect for PostgreSqlDialect {
    fn greatest_skips_nulls(&self) -> bool {
        true
    }

    fn float_literal(&self, text: &str) -> String {
        // `1.5` is a numeric here, exact (`0.1 + 0.2 == 0.3`), where a number
        // with a point is a double on the other engines.
        format!("CAST({} AS double precision)", text)
    }
    fn number_to_string(&self) -> Option<&'static str> {
        Some("(SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(CAST(synalog_v AS numeric)) < 0.0000000000000005 THEN '0' WHEN CAST(synalog_v AS numeric) = FLOOR(CAST(synalog_v AS numeric)) AND ABS(CAST(synalog_v AS numeric)) < 1e18 THEN CAST(CAST(CAST(synalog_v AS numeric) AS BIGINT) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e38 THEN CAST(CAST(synalog_v AS numeric) AS TEXT) WHEN ABS(CAST(synalog_v AS numeric)) >= 1e15 THEN CAST(ROUND(CAST(CAST(synalog_v AS numeric) AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS TEXT) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(CAST(synalog_v AS numeric), 14 - CAST(FLOOR(LOG(COALESCE(NULLIF(ABS(CAST(synalog_v AS numeric)), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS TEXT))) END) FROM (SELECT {0} AS synalog_v) AS synalog_n)")
    }
    fn str_literal(&self, s: &str) -> String {
        // A server with standard_conforming_strings off reads a backslash in
        // '...' as an escape, which could end the literal: E'...' reads it as
        // one whatever the setting, so a backslash is written doubled there.
        let escaped = s.replace('\'', "''");
        if s.contains('\\') {
            format!("E'{}'", escaped.replace('\\', "\\\\"))
        } else {
            format!("'{}'", escaped)
        }
    }
    fn int64_of_text(&self) -> Option<&'static str> {
        Some("CAST({0} AS BIGINT)")
    }
    fn double_type(&self) -> &'static str {
        "double precision"
    }

    fn boolean_min_max(&self) -> Option<(&'static str, &'static str)> {
        Some(("BOOL_AND(%s)", "BOOL_OR(%s)"))
    }

    fn log10_function(&self) -> &'static str {
        "LOG"
    }
    fn nulls_first_by_default(&self, descending: bool) -> bool { descending }
    fn format_uses_concat(&self) -> bool { true }
    fn name(&self) -> &'static str { "psql" }
    fn today_relation_sql(&self) -> String {
        "(SELECT to_char(current_timestamp AT TIME ZONE 'UTC', 'YYYY-MM-DD') AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("RegexpContains", "({0} ~ {1})");
        m.insert("RegexpReplace", "regexp_replace({0}, {1}, {2}, 'g')");
        m.insert("RegexpExtract", "SUBSTRING({0} FROM {1})");
        m.insert("Div", "CAST((CASE WHEN (({0}) < 0) <> (({1}) < 0) THEN CEIL(CAST({0} AS double precision) / NULLIF({1}, 0)) ELSE FLOOR(CAST({0} AS double precision) / NULLIF({1}, 0)) END) AS BIGINT)");
        // ARRAY_AGG of no rows is null: Range(0) is the empty array.
        m.insert("Range", "COALESCE((SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, {0} - 1) as x), '{}')");
        m.insert("RangeOf", "(SELECT ARRAY_AGG(x) FROM GENERATE_SERIES(0, ARRAY_LENGTH({0}, 1) - 1) as x)");
        m.insert("StringAgg", "STRING_AGG(CAST({0} AS TEXT), ',')");
        m.insert("ToString", "CAST(%s AS TEXT)");
        // A double rounds half to even here (2.5 to 2); a numeric rounds half
        // away from zero, as on the other engines (2.5 to 3).
        m.insert("ToInt64", "CAST(ROUND(CAST(%s AS numeric)) AS BIGINT)");
        m.insert("Round", "ROUND(CAST(%s AS numeric))");
        m.insert("ToFloat64", "CAST(%s AS double precision)");
        m.insert("Element", "({0})[{1} + 1]");
        // 0 for an empty array, null for a null one (ARRAY_LENGTH is null
        // for both).
        m.insert("Size", "CARDINALITY({0})");
        m.insert("Count", "COUNT(DISTINCT {0})");
        m.insert("MagicalEntangle", "(CASE WHEN {1} = 0 THEN {0} ELSE NULL END)");
        m.insert("ArrayConcat", "{0} || {1}");
        // STRING_TO_ARRAY('', ',') is empty; elsewhere one empty part.
        m.insert("Split", "(CASE WHEN {0} = '' THEN ARRAY[''] ELSE STRING_TO_ARRAY({0}, {1}) END)");
        m.insert("AnyValue", "(ARRAY_AGG(%s))[1]");
        m.insert("Log", "LN(%s)");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        // `/` divides exactly, as BigQuery, DuckDB and Spark do: this engine
        // divides integers to an integer (7 / 2 = 3).
        m.insert("/", "CAST(%s AS double precision) / NULLIF(%s, 0)");
        // MOD takes integers and numerics, not doubles.
        m.insert("%", "MOD(CAST(%s AS numeric), NULLIF(CAST(%s AS numeric), 0))");
        m.insert("++", "%s || %s");
        m.insert("in", "%s = ANY(%s)");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("({}).{}", record, self.record_field(subscript))
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

ArgMin(a) = SqlExpr("(ARRAY_AGG({arg} order by {value} nulls last))[1]",
                    {arg: a.arg, value: a.value});

ArgMax(a) = SqlExpr(
  "(ARRAY_AGG({arg} order by {value} desc nulls last))[1]",
  {arg: a.arg, value: a.value});

ArgMaxK(a, l) = SqlExpr(
  "(ARRAY_AGG({arg} order by {value} desc nulls last))[1:{lim}]",
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

Chr(x) = SqlExpr("Chr({x})", {x:});

Num(a) = a;
Str(a) = a;
"#
    }

    fn unnest_phrase(&self) -> &'static str { "UNNEST({0}) as {1}" }
    fn unnest_records_phrase(&self) -> &'static str { "LATERAL (SELECT UNNEST({0}) AS {1}) AS pushkin_{1}" }
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

    fn typed_array(&self, array: &str, element: &Type) -> Option<String> {
        let t = match element {
            Type::Number => "numeric",
            Type::String => "text",
            Type::Bool => "bool",
            _ => return None,
        };
        Some(format!("CAST({} AS {}[])", array, t))
    }

    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String {
        // PostgreSQL exposes named record fields only through a declared
        // composite type (`(record).field`). The `CREATE TYPE` for this shape is
        // emitted in the preamble (see `record_type_definitions`); here we emit
        // `ROW(v1, …)::<type-name>`. Fields are sorted into the canonical order
        // the type declaration uses so values line up positionally.
        let mut fs: Vec<(&str, &str, &Type)> = fields.to_vec();
        fs.sort_by(|a, b| a.0.cmp(b.0));
        let vals: Vec<&str> = fs.iter().map(|t| t.1).collect();
        let ty = Type::Record {
            fields: fs.iter().map(|t| (t.0.to_string(), t.2.clone())).collect(),
            is_opened: false,
        };
        format!("ROW({})::{}", vals.join(", "), record_type_name(&ty))
    }

    fn scalar_sql_type(&self, ty: &Type) -> String {
        match ty {
            Type::Number => "numeric".to_string(),
            Type::Bool => "boolean".to_string(),
            Type::List(inner) => format!("{}[]", self.scalar_sql_type(inner)),
            _ => "text".to_string(),
        }
    }

    fn regex_match_condition(&self, column_expr: &str, pattern: &str) -> String {
        // The pattern is a string literal like any other: the dialect's own
        // escapes (a backslash ends a literal on Spark and BigQuery otherwise).
        format!("{} ~ {}", column_expr, self.str_literal(pattern))
    }
}

// ---------------------------------------------------------------------------
// Trino
// ---------------------------------------------------------------------------

pub struct TrinoDialect;

impl Dialect for TrinoDialect {
    fn bind_value(&self) -> &'static str { "element_at(transform(ARRAY[{0}], synalog_v -> {body}), 1)" }
    fn number_to_string(&self) -> Option<&'static str> {
        Some("element_at(transform(ARRAY[{0}], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS VARCHAR) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM CAST(CAST(ROUND(synalog_v, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS VARCHAR))) END)), 1)")
    }
    fn pagination_clause(&self, limit: Option<u64>, offset: Option<u64>) -> String {
        let mut clause = String::new();
        if let Some(offset) = offset {
            clause.push_str(&format!("\nOFFSET {}", offset));
        }
        if let Some(limit) = limit {
            clause.push_str(&format!("\nLIMIT {}", limit));
        }
        clause
    }
    fn format_uses_concat(&self) -> bool { true }
    fn float_literal(&self, text: &str) -> String {
        // `1.5` is a DECIMAL here, and decimal division rounds to the
        // operands' scale (1.0 / 3.0 = 0.3); the exponent form is a DOUBLE.
        if text.contains(['e', 'E']) { text.to_string() } else { format!("{}E0", text) }
    }

    fn name(&self) -> &'static str { "trino" }
    fn today_relation_sql(&self) -> String {
        "(SELECT CAST(CAST(current_timestamp AT TIME ZONE 'UTC' AS DATE) AS VARCHAR) AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) AS timestamp)".to_string()
    }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS VARCHAR)", expr) }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        // ARRAY_JOIN skips nulls: the repetition of a null is null.
        m.insert("Repeat", "(CASE WHEN {0} IS NULL OR {1} IS NULL THEN NULL ELSE ARRAY_JOIN(REPEAT({0}, {1}), '') END)");
        // SUBSTR and REVERSE of an untyped null are ambiguous here.
        m.insert("StartsWith", "starts_with(CAST({0} AS VARCHAR), CAST({1} AS VARCHAR))");
        m.insert("EndsWith", "starts_with(REVERSE(CAST({0} AS VARCHAR)), REVERSE(CAST({1} AS VARCHAR)))");
        // SEQUENCE(0, -1) counts down, [0, -1]: Range(0) is empty.
        m.insert("Range", "FILTER(SEQUENCE(0, {0}), x -> x < {0})");
        // CAST writes a DOUBLE in scientific notation (1.5E0); format does
        // not, but writes a null as 'null': only non-null values are formatted.
        // `format` writes a double as the other engines do (1.5, not 1.5E0),
        // but a timestamp in ISO with a `T`: a timestamp is cast instead, so
        // its text is `2026-10-05 15:19:59.910` as elsewhere.
        m.insert("ToString", "element_at(transform(filter(ARRAY[{0}], v -> v IS NOT NULL), v -> IF(typeof(v) LIKE 'timestamp%', CAST(v AS VARCHAR), format('%s', v))), 1)");
        m.insert("StringAgg", "(CASE WHEN COUNT({0}) > 0 THEN ARRAY_JOIN(ARRAY_AGG(CAST({0} AS VARCHAR)), ',') END)");
        m.insert("Join", "ARRAY_JOIN({0}, {1})");
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
        m.insert("Element", "(CASE WHEN {1} < 0 THEN NULL ELSE ELEMENT_AT({0}, {1} + 1) END)");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        // `/` divides exactly, as BigQuery, DuckDB and Spark do: this engine
        // divides integers to an integer (7 / 2 = 3).
        m.insert("/", "CAST(%s AS DOUBLE) / NULLIF(%s, 0)");
        m.insert("++", "CONCAT(%s, %s)");
        // Deviation: upstream emits `x IN UNNEST(arr)` (BigQuery syntax).
        m.insert("in", "CONTAINS({1}, {0})");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, self.record_field(subscript))
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

    // UNNEST spreads an array of rows into a column per field: each element
    // goes in a row of one field, so it stays one column, a record or not
    // (the type of a list's elements is not always known).
    fn unnest_phrase(&self) -> &'static str { "UNNEST(TRANSFORM({0}, synalog_e -> ROW(synalog_e))) as pushkin({1})" }
    fn array_phrase(&self) -> &'static str { "ARRAY[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Index }
    fn decorate_combine_rule(&self) -> bool { false }

    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String {
        // Named record fields require an explicit row type:
        // `CAST(ROW(v1, …) AS ROW(field type, …))`. Sort fields into a canonical
        // order so the value list and the type list line up at every nesting
        // level (nested records recurse through `row_field_type`, which sorts too).
        let mut fs: Vec<(&str, &str, &Type)> = fields.to_vec();
        fs.sort_by(|a, b| a.0.cmp(b.0));
        let vals: Vec<&str> = fs.iter().map(|t| t.1).collect();
        let types: Vec<String> = fs
            .iter()
            .map(|t| format!("{} {}", self.record_field(t.0), self.row_field_type(t.2)))
            .collect();
        format!("CAST(ROW({}) AS ROW({}))", vals.join(", "), types.join(", "))
    }
}

// Presto
// ---------------------------------------------------------------------------

pub struct PrestoDialect;

impl Dialect for PrestoDialect {
    fn bind_value(&self) -> &'static str { "element_at(transform(ARRAY[{0}], synalog_v -> {body}), 1)" }
    fn number_to_string(&self) -> Option<&'static str> {
        Some("element_at(transform(ARRAY[{0}], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) >= 1e15 THEN CAST(ROUND(CAST(synalog_v AS DECIMAL(38,0)), 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS VARCHAR) ELSE rtrim(rtrim(CAST(CAST(ROUND(synalog_v, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)) AS DECIMAL(38,15)) AS VARCHAR), '0'), '.') END)), 1)")
    }
    fn supports_offset(&self) -> bool { false }
    fn pagination_clause(&self, limit: Option<u64>, offset: Option<u64>) -> String {
        let mut clause = String::new();
        if let Some(offset) = offset {
            clause.push_str(&format!("\nOFFSET {}", offset));
        }
        if let Some(limit) = limit {
            clause.push_str(&format!("\nLIMIT {}", limit));
        }
        clause
    }
    fn float_literal(&self, text: &str) -> String {
        // `1.5` is a DECIMAL here, and decimal division rounds to the
        // operands' scale (1.0 / 3.0 = 0.3); the exponent form is a DOUBLE.
        if text.contains(['e', 'E']) { text.to_string() } else { format!("{}E0", text) }
    }

    fn name(&self) -> &'static str { "presto" }
    fn format_uses_concat(&self) -> bool { true }
    fn today_relation_sql(&self) -> String {
        "(SELECT CAST(CAST(current_timestamp AT TIME ZONE 'UTC' AS DATE) AS VARCHAR) AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT CAST(current_timestamp AT TIME ZONE 'UTC' AS TIMESTAMP) AS timestamp)".to_string()
    }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS VARCHAR)", expr) }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        // ARRAY_JOIN skips nulls: the repetition of a null is null.
        m.insert("Repeat", "(CASE WHEN {0} IS NULL OR {1} IS NULL THEN NULL ELSE ARRAY_JOIN(REPEAT({0}, {1}), '') END)");
        // SUBSTR and REVERSE of an untyped null are ambiguous here.
        m.insert("StartsWith", "starts_with(CAST({0} AS VARCHAR), CAST({1} AS VARCHAR))");
        m.insert("EndsWith", "starts_with(REVERSE(CAST({0} AS VARCHAR)), REVERSE(CAST({1} AS VARCHAR)))");
        // SEQUENCE(0, -1) counts down, [0, -1]: Range(0) is empty.
        m.insert("Range", "FILTER(SEQUENCE(0, {0}), x -> x < {0})");
        m.insert("ToString", "CAST(%s AS VARCHAR)");
        m.insert("StringAgg", "(CASE WHEN COUNT({0}) > 0 THEN ARRAY_JOIN(ARRAY_AGG(CAST({0} AS VARCHAR)), ',') END)");
        m.insert("Join", "ARRAY_JOIN({0}, {1})");
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
        m.insert("Element", "(CASE WHEN {1} < 0 THEN NULL ELSE ELEMENT_AT({0}, {1} + 1) END)");
        m
    }

    fn infix_operators(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        // `/` divides exactly, as BigQuery, DuckDB and Spark do: this engine
        // divides integers to an integer (7 / 2 = 3).
        m.insert("/", "CAST(%s AS DOUBLE) / NULLIF(%s, 0)");
        m.insert("++", "CONCAT(%s, %s)");
        // Deviation: upstream emits `x IN UNNEST(arr)` (BigQuery syntax).
        m.insert("in", "CONTAINS({1}, {0})");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, self.record_field(subscript))
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

    // UNNEST spreads an array of rows into a column per field: each element
    // goes in a row of one field, so it stays one column, a record or not
    // (the type of a list's elements is not always known).
    fn unnest_phrase(&self) -> &'static str { "UNNEST(TRANSFORM({0}, synalog_e -> ROW(synalog_e))) as pushkin({1})" }
    fn array_phrase(&self) -> &'static str { "ARRAY[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Index }
    fn decorate_combine_rule(&self) -> bool { false }

    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String {
        // Named record fields require an explicit row type:
        // `CAST(ROW(v1, …) AS ROW(field type, …))`. Sort fields into a canonical
        // order so the value list and the type list line up at every nesting
        // level (nested records recurse through `row_field_type`, which sorts too).
        let mut fs: Vec<(&str, &str, &Type)> = fields.to_vec();
        fs.sort_by(|a, b| a.0.cmp(b.0));
        let vals: Vec<&str> = fs.iter().map(|t| t.1).collect();
        let types: Vec<String> = fs
            .iter()
            .map(|t| format!("{} {}", self.record_field(t.0), self.row_field_type(t.2)))
            .collect();
        format!("CAST(ROW({}) AS ROW({}))", vals.join(", "), types.join(", "))
    }
}

// ---------------------------------------------------------------------------
// Databricks
// ---------------------------------------------------------------------------

pub struct DatabricksDialect;

impl Dialect for DatabricksDialect {
    fn greatest_skips_nulls(&self) -> bool {
        true
    }

    fn bind_value(&self) -> &'static str { "transform(array({0}), synalog_v -> {body})[0]" }
    // Spark rounds to a constant number of digits only: a double is
    // formatted to the digits it needs, a large number built from its
    // exponent form.
    fn number_to_string(&self) -> Option<&'static str> {
        Some("transform(array({0}), synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN concat(CASE WHEN synalog_v < 0 THEN '-' ELSE '' END, substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 1, 1), substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 3, 14), repeat('0', CAST(substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), instr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 'e') + 1) AS INT) - 14)) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM format_string(concat('%.', CAST(GREATEST(1, LEAST(15, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT))) AS STRING), 'f'), CAST(synalog_v AS DOUBLE)))) END))[0]")
    }
    fn nulls_first_by_default(&self, descending: bool) -> bool { !descending }
    fn float_literal(&self, text: &str) -> String {
        // `1.5` is a DECIMAL here, and decimal division rounds to the
        // operands' scale (1.0 / 3.0 = 0.3); the exponent form is a DOUBLE.
        if text.contains(['e', 'E']) { text.to_string() } else { format!("{}E0", text) }
    }

    fn typed_array(&self, array: &str, element: &Type) -> Option<String> {
        // A null is no array to ELEMENT_AT or SIZE.
        if array != "null" {
            return None;
        }
        let t = match element {
            Type::Number => "DOUBLE",
            Type::String => "STRING",
            Type::Bool => "BOOLEAN",
            _ => return None,
        };
        Some(format!("CAST(null AS ARRAY<{}>)", t))
    }

    fn quote_identifier(&self, name: &str) -> String {
        // Double quotes make a string here: identifiers take backticks,
        // a backtick inside doubled.
        format!("`{}`", name.replace('`', "``"))
    }

    fn name(&self) -> &'static str { "databricks" }
    fn string_cast(&self, expr: &str) -> String { format!("CAST({} AS STRING)", expr) }
    fn today_relation_sql(&self) -> String {
        "(SELECT CAST(to_date(to_utc_timestamp(current_timestamp(), current_timezone())) AS STRING) AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT to_utc_timestamp(current_timestamp(), current_timezone()) AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("Strpos", "INSTR({0}, {1})");
        m.insert("RegexpContains", "({0} RLIKE {1})");
        m.insert("RegexpExtract", "(CASE WHEN {0} RLIKE {1} THEN REGEXP_EXTRACT({0}, {1}, 0) END)");
        m.insert("ToString", "CAST(%s AS STRING)");
        m.insert("StringAgg", "(CASE WHEN COUNT({0}) > 0 THEN ARRAY_JOIN(COLLECT_LIST(CAST({0} AS STRING)), ',') END)");
        m.insert("Join", "ARRAY_JOIN({0}, {1})");
        // Spark's SPLIT takes a regular expression: `.` would split at every
        // character. A backslash before each character that is not a letter
        // or a digit makes the separator literal (`\E` too, unlike `\Q…\E`).
        m.insert("Split", r"SPLIT({0}, REGEXP_REPLACE({1}, '([^a-zA-Z0-9])', '\\\\$1'))");
        // Spark's CAST truncates a fraction; the other engines round it (half
        // away from zero), as ROUND does. ROUND keeps an integer as it is.
        m.insert("ToInt64", "CAST(ROUND({0}) AS BIGINT)");
        m.insert("ToFloat64", "CAST(%s AS DOUBLE)");
        m.insert("AnyValue", "ANY_VALUE(%s)");
        // `::` cast is unavailable on Spark and superfluous on Databricks; CAST
        // is portable across both.
        // A string literal takes backslash escapes here: '\\' is one backslash.
        m.insert("ILike", "(CAST({0} AS STRING) ILIKE {1} ESCAPE '\\\\')");
        m.insert("Like", "(CAST({0} AS STRING) LIKE {1} ESCAPE '\\\\')");
        m.insert("Replace", "REPLACE(CAST({0} AS STRING), {1}, {2})");
        // CONCAT concatenates arrays on Spark/Databricks; ARRAY_JOIN instead
        // stringifies an array with a delimiter (a different function).
        m.insert("ArrayConcat", "CONCAT({0}, {1})");
        m.insert("JsonExtract", "GET_JSON_OBJECT({0}, {1})");
        m.insert("JsonExtractScalar", "GET_JSON_OBJECT({0}, {1})");
        // Range/Size: the BigQuery defaults (GENERATE_ARRAY/ARRAY_LENGTH) do
        // not exist on Spark SQL; `Length` (string length) inherits the default
        // LENGTH — the previous ARRAY_SIZE override broke it for strings.
        // SEQUENCE(0, -1) counts down, [0, -1]: Range(0) is empty.
        // SEQUENCE takes integers: a number of a list Spark types as doubles is one.
        m.insert("Range", "FILTER(SEQUENCE(0, CAST({0} AS BIGINT)), x -> x < {0})");
        m.insert("RangeOf", "SEQUENCE(0, SIZE(%s) - 1)");
        // SIZE(null) is -1 on Spark; ARRAY_SIZE(null) is null.
        m.insert("Size", "ARRAY_SIZE(%s)");
        // ELEMENT_AT is 1-based; the default `{0}[OFFSET({1})]` is BigQuery-only.
        // A list of no rows is null, as on the other engines (COLLECT_LIST
        // gives an empty one).
        // Spark's ARRAY_AGG skips nulls: the values are collected in structs,
        // which are never null, so that a null is collected as elsewhere.
        m.insert("List", "(CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(%s AS v)), s -> s.v) END)");
        m.insert("Set", "(CASE WHEN COUNT(*) = 0 THEN NULL ELSE ARRAY_DISTINCT(TRANSFORM(COLLECT_LIST(STRUCT(%s AS v)), s -> s.v)) END)");
        // ELEMENT_AT takes an INT index here, not a BIGINT (`ToInt64(...)`).
        m.insert("Element", "(CASE WHEN {1} < 0 THEN NULL ELSE ELEMENT_AT({0}, CAST({1} AS INT) + 1) END)");
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
        format!("{}.{}", record, self.record_field(subscript))
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
  "(CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(SLICE(SORT_ARRAY(COLLECT_LIST(STRUCT({value} AS value, {arg} AS arg)), false), 1, {lim}), s -> s.arg) END)",
  {arg: a.arg, value: a.value, lim: l});
ArgMinK(a, l) = SqlExpr(
  "(CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(SLICE(SORT_ARRAY(COLLECT_LIST(STRUCT({value} AS value, {arg} AS arg))), 1, {lim}), s -> s.arg) END)",
  {arg: a.arg, value: a.value, lim: l});
RMatch(s, p) = SqlExpr(
  "REGEXP_LIKE({s}, {p})",
  {s: s, p: p});
RExtract(s, p, g) = SqlExpr(
  "REGEXP_SUBSTR({s}, {p}, 1, 1, 'c', {g})",
  {s: s, p: p, g: g});

Array(a) = SqlExpr(
  "(CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT({arg} AS arg, {value} AS value))), s -> s.value) END)",
  {arg: a.arg, value: a.value});
"#
    }

    // A LATERAL subquery: Spark does not resolve a column of an earlier
    // table inside a table function of the FROM list (`explode(t.l)`).
    fn unnest_phrase(&self) -> &'static str { "LATERAL (SELECT explode({0}) AS {1}) AS pushkin" }
    fn array_phrase(&self) -> &'static str { "ARRAY(%s)" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Index }
    fn decorate_combine_rule(&self) -> bool { false }

    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v, _)| format!("{} AS {}", v, self.record_field(k))).collect();
        format!("STRUCT({})", pairs.join(", "))
    }

    fn str_literal(&self, s: &str) -> String {
        // Spark substitutes `${var}` in a statement's text before it parses
        // it, inside literals too (`"${env:HOME}"`): a dollar is `\u0024`.
        backslash_escaped_literal(s).replace('$', "\\u0024")
    }
}

// ---------------------------------------------------------------------------
// DuckDB
// ---------------------------------------------------------------------------

pub struct DuckDbDialect;

impl Dialect for DuckDbDialect {
    fn greatest_skips_nulls(&self) -> bool {
        true
    }

    fn float_literal(&self, text: &str) -> String {
        // `1.5` is a DECIMAL here, whose products overflow (DECIMAL(18)) and
        // whose sums are exact (`0.1 + 0.2 == 0.3`); the exponent form is a
        // DOUBLE, as a number with a point is on the other engines.
        if text.contains(['e', 'E']) { text.to_string() } else { format!("{}E0", text) }
    }
    fn bind_value(&self) -> &'static str { "list_transform([{0}], synalog_v -> {body})[1]" }
    // DuckDB rounds a DECIMAL to a constant number of digits only: a double
    // is formatted to the digits it needs, a large number built from its
    // exponent form.
    fn number_to_string(&self) -> Option<&'static str> {
        Some("list_transform([{0}], synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS VARCHAR) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS VARCHAR) WHEN ABS(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 1, 1) || substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 3, 14) || repeat('0', CAST(substr(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), strpos(format('{:.14e}', ABS(CAST(synalog_v AS DOUBLE))), 'e') + 1) AS INTEGER) - 14) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM format('{:.{}f}', CAST(synalog_v AS DOUBLE), GREATEST(1, LEAST(15, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INTEGER)))))) END))[1]")
    }
    fn name(&self) -> &'static str { "duckdb" }
    fn int64_of_text(&self) -> Option<&'static str> {
        Some("CAST({0} AS BIGINT)")
    }

    fn today_relation_sql(&self) -> String {
        "(SELECT strftime(current_timestamp AT TIME ZONE 'UTC', '%Y-%m-%d') AS date)".to_string()
    }
    fn now_relation_sql(&self) -> String {
        "(SELECT current_timestamp AT TIME ZONE 'UTC' AS timestamp)".to_string()
    }

    fn built_in_functions(&self) -> HashMap<&'static str, &'static str> {
        let mut m = HashMap::new();
        m.insert("RegexpContains", "regexp_matches({0}, {1})");
        m.insert("RegexpReplace", "regexp_replace({0}, {1}, {2}, 'g')");
        m.insert("RegexpExtract", "(CASE WHEN regexp_matches({0}, {1}) THEN regexp_extract({0}, {1}) END)");
        m.insert("Element", "(CASE WHEN {1} < 0 THEN NULL ELSE array_extract({0}, CAST({1} + 1 AS BIGINT)) END)");
        // A cast rounds a double half to even (2.5 to 2); ROUND rounds half
        // away from zero, as the other engines (2.5 to 3).
        m.insert("ToInt64", "CAST(ROUND(%s) AS BIGINT)");
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
        m.insert("%", "(%s) % NULLIF(%s, 0)");
        m.insert("in", "list_contains({right}, {left})");
        m
    }

    fn subscript(&self, record: &str, subscript: &str, _record_is_table: bool) -> String {
        format!("{}.{}", record, self.record_field(subscript))
    }

    fn library_program(&self) -> &'static str {
        r#"
->(left:, right:) = {arg: left, value: right};
`=`(left:, right:) = right :- left == right;

Arrow(left, right) = arrow :-
  left == arrow.arg,
  right == arrow.value;

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
"#
    }

    fn unnest_phrase(&self) -> &'static str { "(select unnest({0}) as unnested_pod) as {1}" }
    fn array_phrase(&self) -> &'static str { "[%s]" }
    fn group_by_spec_by(&self) -> GroupBySpec { GroupBySpec::Expr }
    fn is_postgresqlish(&self) -> bool { true }

    fn record_literal(&self, fields: &[(&str, &str, &Type)]) -> String {
        let pairs: Vec<String> = fields.iter()
            .map(|(k, v, _)| format!("{}: {}", self.record_field(k), v)).collect();
        format!("{{{}}}", pairs.join(", "))
    }

    fn regex_match_condition(&self, column_expr: &str, pattern: &str) -> String {
        // The pattern is a string literal like any other: the dialect's own
        // escapes (a backslash ends a literal on Spark and BigQuery otherwise).
        format!("regexp_matches({}, {})", column_expr, self.str_literal(pattern))
    }
}

#[cfg(test)]
#[path = "dialects_test.rs"]
mod dialects_test;

/// `Round(x, digits)` as a template of `{0}` and `{1}`, the same on every
/// engine: the number as its text shows it, at 15 significant digits, rounded
/// half away from zero, as a spreadsheet rounds (`Round(1.005, 2)` is 1.01,
/// though the double nearest 1.005 is below it). The half unit of the 15th
/// significant digit is added before the floor; where that digit is left of
/// the place rounded to, the number at 15 digits is the result. `+ 0` makes
/// a negative zero zero.
pub fn round_to_digits_template(dialect: &dyn Dialect) -> String {
    let v = format!("CAST(synalog_v AS {})", dialect.double_type());
    let e = format!("FLOOR({}(ABS({})))", dialect.log10_function(), v);
    let sign = format!("(CASE WHEN {} < 0 THEN -1 ELSE 1 END)", v);
    let body = format!(
        "(CASE WHEN synalog_v IS NULL OR {{1}} IS NULL THEN NULL WHEN {v} = 0 THEN {v} \
         WHEN {e} - 14 + {{1}} >= 0 THEN {sign} * FLOOR(ABS({v}) / POWER(10, {e} - 14) + 0.5) * POWER(10, {e} - 14) + 0 \
         ELSE {sign} * FLOOR(ABS({v}) * POWER(10, {{1}}) + 0.5 + 0.5 * POWER(10, {e} - 14 + {{1}})) / POWER(10, {{1}}) + 0 END)",
        v = v, e = e, sign = sign
    );
    dialect.bind_value().replace("{body}", &body)
}
