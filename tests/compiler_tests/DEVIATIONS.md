# Intentional deviations from upstream Python Logica

Golden `.sql` files are normally generated from upstream Python Logica
(`generate_expected_sql.py`), and synalog's compiler is held to byte-parity
with them. For the cases below, upstream emits SQL that **cannot execute** on
the target engine, so synalog deviates and the golden files are generated
from synalog itself (verified by the e2e suite against live engines —
`tests/e2e`).

When re-running `generate_expected_sql.py`, do not overwrite the fixtures
listed here; regenerate their goldens with `synalog.compile` instead.

## Trino and Presto

Upstream emits BigQuery-style constructs that do not exist on Trino/Presto:

| Logica construct | upstream emits        | synalog emits (deviation)   |
|------------------|-----------------------|------------------------------|
| `Size(arr)`      | `ARRAY_LENGTH(arr)`   | `CARDINALITY(arr)`          |
| `Log(x)`         | `LOG(x)` (wrong arity on Trino, missing on Presto) | `LN(x)` |
| `++=` / ArrayConcatAgg | `ARRAY_CONCAT_AGG(x)` | `FLATTEN(ARRAY_AGG(x))` |
| `Element(arr, i)`| `arr[OFFSET(i)]`      | `ELEMENT_AT(arr, i + 1)`    |
| `x in arr`       | `x IN UNNEST(arr)`    | `CONTAINS(arr, x)`          |
| `ArrayConcat(a, b)` (Presto) | `ARRAY_CONCAT(a, b)` | `a \|\| b` (matches upstream's Trino mapping) |

Affected goldens (generated from synalog, not upstream):
`trino/{06_arrays,23_combine,48_split_function,50_array_functions,51_math_functions}.sql`
and the same five under `presto/`.

## Databricks

Upstream's `databricks` dialect inherits BigQuery-style constructs that do not
run on Spark SQL — and therefore not on Databricks, whose SQL surface is Spark
SQL plus extensions. synalog emits Spark/Databricks-valid SQL instead:

| Logica construct | upstream emits        | synalog emits (deviation)   |
|------------------|-----------------------|------------------------------|
| `Range(n)` / `RangeOf(a)` | `GENERATE_ARRAY(0, n - 1)` | `SEQUENCE(0, n - 1)` |
| `Size(arr)`      | `ARRAY_LENGTH(arr)`   | `SIZE(arr)`                 |
| `Length(s)` (string) | `ARRAY_SIZE(s)` (wrong — array fn) | `LENGTH(s)` (default) |
| `Element(arr, i)`| `arr[OFFSET(i)]`      | `ELEMENT_AT(arr, i + 1)`    |
| `Format(...)`    | `FORMAT(...)`         | `FORMAT_STRING(...)`        |
| `ArrayConcat(a, b)` | `ARRAY_JOIN(a, b)` (wrong — stringifies) | `CONCAT(a, b)` |
| `++=` / ArrayConcatAgg | `ARRAY_CONCAT_AGG(x)` | `FLATTEN(COLLECT_LIST(x))` |
| `x in arr`       | `ARRAY_CONTAINS(x, arr)` (args reversed) | `ARRAY_CONTAINS(arr, x)` |
| `Like` / `ILike` / `Replace` | `x::string` cast | `CAST(x AS STRING)` (portable) |
| `List=`/`Array=`/`ArgMin`/`ArgMax`(K) | `ARRAY_AGG(x ORDER BY y)` | `SORT_ARRAY`/`ARRAY_SORT(COLLECT_LIST(STRUCT(...)))` |

Spark/Databricks `COLLECT_LIST` (`ARRAY_AGG`) does not accept an in-aggregate
`ORDER BY`, so ordered aggregates collect `STRUCT(value, arg)` pairs and sort
the resulting array. Verified by executing every fixture against an Apache Spark
Thrift Server (the open-source Databricks stand-in; see `tests/e2e`) and
comparing results to DuckDB. Affected goldens are generated from synalog, not
upstream (32 fixtures, listed in `generate_expected_sql.py:SYNALOG_GOLDENS`).

## `Today` / `Now` built-in concepts (synalog-only)

`Today`/`Now` are synalog-only built-in concepts — upstream Logica has neither.
The **compiler inlines them per dialect** as a one-row relation over the
engine's native clock — no runtime table, so they work on every engine
including BigQuery and read-only catalogs:

| Concept            | inlined relation (DuckDB example)                         |
|--------------------|-----------------------------------------------------------|
| `Today(date:)`     | `(SELECT strftime(current_date, '%Y-%m-%d') AS date)`     |
| `Now(timestamp:)`  | `(SELECT current_timestamp AS timestamp)`                 |

`Now` is the most precise value; coarser parts (date, time, hour) are derived
via the `Substr`/`ToInt64` pipeline rather than exposed as extra fields. Both
names are reserved (the verifier rejects redefinition). The
`52_today_now` golden on every engine is generated from synalog, not upstream
(listed in `generate_expected_sql.py:SYNALOG_GOLDENS`).

## `SqlExpr` rejected in user programs (synalog-only verifier check)

Upstream Logica exposes `SqlExpr("...", {...})` as a general raw-SQL escape
hatch for user programs. synalog's verifier **rejects** it in user rules: raw
SQL is unparsed, untyped, unverified, and non-portable, defeating the
guarantees the verifier exists to provide. It remains available *internally* to
the dialect library (`ArgMin`/`ArgMax`/regex/...), which is injected during
compilation and never passes through the verifier. This is a verification-time
behavior, so it affects `synalog.check`, not the golden `.sql` files.

## DuckDB

`@Ground` materialization emits `CREATE OR REPLACE TABLE` (upstream parity —
upstream also does this for DuckDB; noted here because it is dialect-gated in
synalog via `Dialect::supports_create_or_replace_table`).

## Known gaps (goldens intentionally absent)

- `duckdb/35_recursive_annotated.sql` — upstream compiles recursive
  aggregating predicates for DuckDB with an iterative "portal" strategy that
  synalog does not implement yet (synalog unrolls iterations instead).
- `psql/29_argmin_argmax.sql` — upstream casts record literals to named
  composite types (`ROW(x)::logicarecordNNN`) backed by a typing preamble;
  synalog does not generate psql typing preambles yet.
- `psql` empty array literals — upstream annotates them with their inferred
  element type (`ARRAY[]::text[]`); synalog's type inference is
  predicate-level only and does not annotate expressions yet. Synalog
  instead emits `'{}'`, an unknown-type literal that PostgreSQL coerces
  from context (CASE branches, function arguments, comparisons). The
  `psql/23_combine.sql` golden is generated from synalog accordingly.
