# Python API

The `synalog` package exposes five functions that take a program (`parse`, `compile`, `search`, `compile_all`, `check`) and two that take nothing and return the names Synalog has already reserved (`reserved_predicates`, `builtin_functions`). The program functions all accept an optional `engine` keyword that overrides the program's `@Engine` annotation (one of `sqlite`, `duckdb`, `bigquery`, `psql`, `presto`, `trino`, `databricks`; default `duckdb`) and an optional `import_root` keyword listing directories where `import` statements look up `.l` files (default: the current directory). They raise `ValueError` on syntax or compilation errors.

## `parse`

```python
parse(source, file_name=None, engine=None, import_root=None) -> str
```

Parse source and return the AST as a JSON string.

```python
import synalog

ast = synalog.parse(source)
```

## `compile`

```python
compile(source, predicate, limit=None, offset=None, engine=None, import_root=None) -> str
```

Compile a single predicate to SQL.

```python
sql = synalog.compile(source, "TopCustomers", limit=20, offset=40)
```

`limit` is combined with the [`@Limit` directive](language/directives.md#limit): the effective limit is `min(limit, @Limit)`. Use `limit`/`offset` for pagination, and make sure every predicate has an [`@OrderBy`](language/directives.md#orderby) so page boundaries are deterministic.

## `search`

```python
search(source, predicate, pattern, limit=None, offset=None, engine=None, import_root=None) -> str
```

Compile a predicate to SQL that keeps only rows where **some column matches the regular expression `pattern`**. Each column is cast to text and matched with the OR of the per-column conditions, using the target engine's native regex operator (`~` on PostgreSQL, `REGEXP` on SQLite, `regexp_matches` on DuckDB, `REGEXP_LIKE` elsewhere). This is a real regular expression, not a SQL `LIKE` pattern. `limit`/`offset` apply to the filtered rows.

```python
sql = synalog.search(source, "Customers", "(?i)acme", limit=20)
```

## `compile_all`

```python
compile_all(source, engine=None, import_root=None) -> dict[str, str]
```

Compile every defined predicate in the program. Returns a mapping `predicate_name -> sql`.

```python
sqls = synalog.compile_all(source)
for name, sql in sqls.items():
    print(name, sql)
```

## `check`

```python
check(source, engine=None, import_root=None) -> list[str]
```

Run structural [verification](verification.md). Returns a list of error messages; empty if the program is valid.

```python
errors = synalog.check(source)
if errors:
    for e in errors:
        print(e)
```

## `reserved_predicates`

```python
reserved_predicates() -> list[str]
```

The predicate names Synalog defines itself, sorted: the [built-in temporal concepts](language/temporal.md) (`Today`, `Now`) and every head of every dialect's library program (`Num`, `Str`, `Epoch`, `ArgMax`, ...). A program may reference these but must not [define](verification.md) them.

## `builtin_functions`

```python
builtin_functions() -> list[str]
```

The function and operator names Synalog compiles to SQL, sorted (`Substr`, `ToString`, `Like`, `IsNull`, ...). These live in a different namespace from predicates: they appear in call position, not as relations.

Both lists exist for hosts that resolve references themselves. If your rules live in a database rather than in `.l` files, `check` alone cannot tell a typo from a predicate defined elsewhere, so you need to know which names are already taken — and which of them are function calls rather than relational references:

```python
reserved = set(synalog.reserved_predicates()) | set(synalog.builtin_functions())
unknown = [name for name in referenced_names(rule) if name not in reserved | defined_in_catalogue]
```

## Executing the generated SQL

Synalog returns SQL strings; execution is up to you. Any driver works: `sqlite3`, `duckdb`, `psycopg`, `google-cloud-bigquery`, `trino`, `databricks-sql-connector`:

```python
import duckdb

sql = synalog.compile(source, "EngineeringTeam")
rows = duckdb.sql(sql).fetchall()
```
