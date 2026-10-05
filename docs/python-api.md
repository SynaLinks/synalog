# Python API

The `synalog` package exposes nine functions that take a program (`parse`, `compile`, `search`, `compile_all`, `check`, `assertions`, `counterexamples`, `plan`, `execute`) and two that take nothing and return the names Synalog has already reserved (`reserved_predicates`, `builtin_functions`). The program functions all accept an optional `engine` keyword that overrides the program's `@Engine` annotation (one of `sqlite`, `duckdb`, `bigquery`, `psql`, `presto`, `trino`, `databricks`; default `duckdb`) and an optional `import_root` keyword listing directories where `import` statements look up `.l` files (default: the current directory). They raise `ValueError` on syntax or compilation errors.

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

The SQL is one script, for clients that run SQL themselves. A script cannot loop, so a [deep recursion](language/recursion.md#how-recursion-runs) is written out step by step, up to the depth `@Recursive` declares, and a recursion too deep to write out (`@Recursive(P, -1)`, or thousands of steps) raises `ValueError`. [`execute`](#execute) runs it instead, stopping when it converges.

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
check(source, engine=None, import_root=None, assertions=True, dsn=None) -> tuple[list[str], list[str]]
```

Run structural [verification](verification.md). Returns `(errors, warnings)`, two lists of messages. The program is valid when `errors` is empty. Warnings do not make it invalid: they report [assertions](assertions.md) that are well-formed but cannot be checked against a database.

The verifier needs no database. When the program passes it and a database is known, `check` also runs the program's `@Assert` statements there: each violated assertion is an error quoting a few counterexamples. A database is known when `dsn` is given, when `SYNALOG_<ENGINE>_DSN` is set, or when the current directory is inside a [project](cli.md) whose `synalog.toml` has a `[connection]`. Otherwise `check` stays offline.

- `assertions=False` skips the database, for callers that need the instant, offline answer.
- A database that cannot be reached is a warning (`Assertions not checked: ...`), not an error.

```python
errors, warnings = synalog.check(source)
for e in errors:
    print("error:", e)
for w in warnings:
    print("warning:", w)
```

## `assertions`

```python
assertions(source, engine=None, import_root=None) -> list[dict]
```

Every [`@Assert`](assertions.md) of the program and where it stands, in source order. Each dict has the keys `predicate`, `name`, `statement`, `status` (`"pending"`, `"unchecked"` or `"unsupported"`) and `detail` (what a pending assertion waits for, or why an assertion is unsupported).

```python
for assertion in synalog.assertions(source):
    print(f"{assertion['predicate']}.{assertion['name']}: {assertion['status']}")
```

Invalid assertions, such as a statement that does not parse, are reported by `check`, not here.

## `counterexamples`

```python
counterexamples(source, predicate, name, limit=None, offset=None, engine=None, import_root=None) -> str
```

Compile the search for the counterexamples of an assertion to SQL. The assertion `name` of `predicate` holds on a database when the query returns no row there; each row is a counterexample, with one column per variable of the statement's leading `∀` (a `∀` nested in a consequent adds none). `limit` and `offset` paginate as in `compile`.

```python
sql = synalog.counterexamples(source, "Ancestor", "transitive", limit=5)
rows = duckdb.sql(sql).fetchall()   # [] when the assertion holds
```

Raises `ValueError` if there is no such assertion, or if it is pending or unsupported.

## `execute`

```python
execute(source, predicate, engine=None, dsn=None, import_root=None, limit=None, offset=None, pattern=None, assertion=None, loads=()) -> tuple[list[str], list[tuple]]
```

Run a predicate on its database and return `(columns, rows)`. Synalog runs the predicate's [plan](#plan) in one connection, so each [recursion](language/recursion.md#how-recursion-runs) stops as soon as a step changes nothing: it costs the steps its data needs, whatever the depth `@Recursive` declares, and `@Recursive(P, -1)` (until nothing changes) runs on every engine.

```python
columns, rows = synalog.execute(source, "TopCustomers", limit=20)
```

- The engine is `engine`, else the program's `@Engine`, else the [project](cli.md#projects-synalogtoml)'s, else duckdb; the connection `dsn`, else `SYNALOG_<ENGINE>_DSN`, else the project's `[connection]`.
- `pattern` keeps the rows where some column matches it, as [`search`](#search); `limit`/`offset` paginate as in `compile`.
- `assertion` returns the counterexamples of the assertion of that name of `predicate` instead of its rows.
- `loads` is a sequence of `(table, path)` pairs: csv/tsv/json/jsonl/parquet files loaded as tables first (duckdb and sqlite).

## `plan`

```python
plan(source, predicate, limit=None, offset=None, engine=None, import_root=None, pattern=None, assertion=None) -> list[dict]
```

The steps that compute a predicate, for a host that runs them itself. Each step is a dict:

| Step | Run it |
|---|---|
| `{"kind": "setup", "sql": ...}` | the engine's setup: a script |
| `{"kind": "sql", "sql": ...}` | a statement; the last step's rows are the predicate's |
| `{"kind": "loop", "body": [...], "repetitions": n, "changed": ...}` | a recursion: run `changed`, a query returning one number; while it is not 0, run the `body` statements, `n` times at most |

All the steps run in one connection: the loops write tables the later steps read. `synalog.runners.run_plan(steps, session)` runs a plan in a [`synalog.runners.session`](cli.md#executing-locally).

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

## `front_matter`

```python
front_matter(source: str) -> str | None
```

The YAML [front matter](language/index.md#front-matter) opening a program file, verbatim (without its `---` delimiters), or `None` when the file has none. Synalog checks that the block is well-formed YAML when it parses a file (`parse`, `compile`, `check` report a syntax error on its line), and `check` reads its `name` and `description` (see [verification](verification.md)); this function lets a host read the rest of the metadata and agree with the parser on where the block ends. Load the values with your YAML library:

```python
import yaml, synalog

source = open("concepts/ActiveCustomer.l").read()
meta = yaml.safe_load(synalog.front_matter(source) or "") or {}
meta.get("description")  # "Customers with at least one delivered order."
```

## Executing the generated SQL

[`execute`](#execute) runs a predicate for you. With `compile`, execution is up to you, and any driver works: `sqlite3`, `duckdb`, `psycopg`, `google-cloud-bigquery`, `trino`, `databricks-sql-connector`:

```python
import duckdb

sql = synalog.compile(source, "EngineeringTeam")
rows = duckdb.sql(sql).fetchall()
```
