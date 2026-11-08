# Supported engines

Synalog compiles to eight SQL dialects. Select the target with the `@Engine` annotation in the program, or override it with the `engine` keyword of any [Python API](python-api.md) function.

| Engine | `@Engine` value | Notes |
|--------|-----------------|-------|
| DuckDB | `duckdb` | Default engine |
| SQLite | `sqlite` | |
| PostgreSQL | `psql` | |
| BigQuery | `bigquery` | |
| Trino | `trino` | |
| Presto | `presto` | |
| Databricks | `databricks` | Double-quoted string literals |
| ClickHouse | `clickhouse` | 26.3 or later; a list is never null |

```synalog
@Engine("psql");
```

```python
# Or override per call:
sql = synalog.compile(source, "TopCustomers", engine="bigquery")
```

## What differs per dialect

Each engine has its own SQL generation for:

- string literals and escaping,
- array syntax and array functions,
- `GROUP BY` style,
- record/struct construction,
- regex matching,
- standard library function names and arities.

Synalog handles these differences in the compiler, so the same program compiles for every engine. The portable subset of the language is the whole language, with one caveat: a few standard library functions have no equivalent on some engines (for example, Presto has no printf-style `Format` function). The compiler maps what it can; genuinely missing functions fail on the engine at execution time.

## ClickHouse

Synalog needs ClickHouse 26.3 (the LTS release) or later: earlier releases decorrelate too few subqueries for aggregating subqueries (`combine`). Each script opens with the session settings it needs (`join_use_nulls`, correlated subqueries, an aggregate of no rows being null, `cast_keep_nullable`, `transform_null_in`), so run its statements in one session, as `synalog … run` does. Records compile to named tuples, an unnesting to `ARRAY JOIN`, tables to `ENGINE = Memory`, and a recursion iterates through tables, as on Trino.

ClickHouse decorrelates a subquery into a join that drops a null key, `IS NOT DISTINCT FROM` included, so a negation tied to its rule by equalities (`~P(x)`, and the step of a semi-naive recursion) compiles to an uncorrelated membership instead: `(keys) NOT IN (SELECT ...)`, the keys compared as text so that a null key matches a null one where `is` says so. A negation of conditions only (`~IsNull(x)`) is their negation.

What ClickHouse cannot express:

- A list is never null (`Nullable(Array)` does not exist): a null list is an empty one, so its `Size` is 0 and a `List` of no rows is `[]`.
- A subquery correlated to the outer row other than by equalities (`combine += 1 :- T(v: w), w > v`) is not supported, and where ClickHouse runs one it can count wrongly; nor is one in an `ORDER BY` or in an aggregate's argument.

These are listed, with the tests they fail, in `tests/e2e/known_failures.py`.

## Scaling

Because the heavy lifting is done by the SQL engine, Synalog inherits its performance characteristics: in-process analytics with DuckDB, embedded with SQLite, warehouse-scale with BigQuery, Trino, Presto, Databricks or ClickHouse, efficiently scaling to petabytes of data.
