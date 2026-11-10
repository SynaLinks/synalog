# Supported engines

Synalog compiles to nine SQL dialects. Select the target with the `@Engine` annotation in the program, or override it with the `engine` keyword of any [Python API](python-api.md) function.

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
| MySQL | `mysql` | 8.4 or later; lists and records are JSON |

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

## MySQL

Synalog needs MySQL 8.4 (the LTS release) or later: `EXCEPT`, `LATERAL` and `JSON_TABLE` are used throughout. Each script opens with the session settings it needs, so run its statements in one session, as `synalog … run` does:

- `sql_mode` `ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES`: standard SQL, where `"` quotes an identifier, `||` concatenates and a backslash is a character of a string.
- `derived_condition_pushdown=off`: MySQL pushes a condition into a derived table by reprinting it with backslash escapes, which ends a literal holding a quote (`'a''b'`) early under `NO_BACKSLASH_ESCAPES`.
- `utf8mb4_0900_bin`, a collation of no padding: texts compare by their characters, case and trailing spaces included, as on every engine. A column of your own tables keeps its collation in a comparison (a case-insensitive one compares so).
- `group_concat_max_len`: an ordered aggregate (`Set`, `Array`, `ArgMax`) joins its values in a text longer than the default 1 KiB.

MySQL has no arrays nor records: a list compiles to a JSON array, a record to a JSON object, and a value read out of one is cast to the type the compiler infers for it. An unnesting is `JSON_TABLE` in a `LATERAL` derived table, an ordered aggregate `GROUP_CONCAT` of the values' JSON. `Median` is not available.

## Scaling

Because the heavy lifting is done by the SQL engine, Synalog inherits its performance characteristics: in-process analytics with DuckDB, embedded with SQLite, warehouse-scale with BigQuery, Trino, Presto, Databricks, ClickHouse or MySQL, efficiently scaling to petabytes of data.
