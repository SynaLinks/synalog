# Supported engines

Synalog compiles to seven SQL dialects. Select the target with the `@Engine` annotation in the program, or override it with the `engine` keyword of any [Python API](python-api.md) function.

| Engine | `@Engine` value | Notes |
|--------|-----------------|-------|
| DuckDB | `duckdb` | Default engine |
| SQLite | `sqlite` | |
| PostgreSQL | `psql` | |
| BigQuery | `bigquery` | |
| Trino | `trino` | |
| Presto | `presto` | |
| Databricks | `databricks` | Double-quoted string literals |

```logica
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

Synalog handles these differences in the compiler, so the same program compiles for every engine. The portable subset of the language is the whole language — with one caveat: a few standard library functions have no equivalent on some engines (for example, Presto has no printf-style `Format` function). The compiler maps what it can; genuinely missing functions fail on the engine at execution time.

## Scaling

Because the heavy lifting is done by the SQL engine, Synalog inherits its performance characteristics: in-process analytics with DuckDB, embedded with SQLite, warehouse-scale with BigQuery, Trino, Presto or Databricks — efficiently scaling to petabytes of data.
