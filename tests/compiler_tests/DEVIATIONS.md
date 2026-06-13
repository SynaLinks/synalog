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
