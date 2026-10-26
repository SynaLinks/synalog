# Python API

The `synalog` package exposes ten functions that take a program (`parse`, `compile`, `search`, `compile_all`, `check`, `assertions`, `counterexamples`, `counterexamples_all`, `plan`, `execute`) two that take nothing and return the names Synalog has already reserved (`reserved_predicates`, `builtin_functions`), and two that render text a report does not control (`quote_value`, `statement_text`). The program functions all accept an optional `engine` keyword that overrides the program's `@Engine` annotation (one of `sqlite`, `duckdb`, `bigquery`, `psql`, `presto`, `trino`, `databricks`; default `duckdb`) and an optional `import_root` keyword listing directories where `import` statements look up `.l` files (default: the current directory). They raise `ValueError` on syntax or compilation errors.

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

The SQL is one script, for clients that run SQL themselves. On DuckDB, SQLite and PostgreSQL a linear recursion is one recursive query, which stops by itself at any depth ([how recursion runs](language/recursion.md#how-recursion-runs)). A script cannot loop, so another deep recursion is written out step by step, up to the depth `@Recursive` declares, and one too deep to write out (`@Recursive(P, -1)`, or thousands of steps) raises `ValueError`. [`execute`](#execute) runs it instead, stopping when it converges.

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
check(source, engine=None, import_root=None, assertions=True, project=None) -> tuple[list[str], list[str]]
```

Run structural [verification](verification.md). Returns `(errors, warnings)`, two lists of messages. The program is valid when `errors` is empty. Warnings do not make it invalid: they report [assertions](assertions.md) that are well-formed but cannot be checked against a database.

The verifier needs no database. When the program passes it and a database is known, `check` also runs the program's `@Assert` statements there: each violated assertion is an error quoting a few counterexamples. A database is known when the program is inside a [project](cli.md#projects-layertoml) whose `layer.toml` has a `[connection]`: the one found from `project`, a folder, or else from the current directory. Otherwise `check` stays offline.

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

Every [`@Assert`](assertions.md) of the program and where it stands, in source order. Each dict has the keys `predicate`, `name`, `statement`, `status` (`"pending"`, `"unchecked"` or `"unsupported"`) `detail` (what a pending assertion waits for, or why an assertion is unsupported) and `predicates` (the predicates the statement names, as written, in order of appearance: what the assertion depends on; empty when the statement does not parse). A host keeping its own dependency graph takes it whole from [`dependencies`](#dependencies).

```python
for assertion in synalog.assertions(source):
    print(f"{assertion['predicate']}.{assertion['name']}: {assertion['status']}")
```

Invalid assertions, such as a statement that does not parse, are reported by `check`, not here.

## `dependencies`

```python
dependencies(source, import_root=None) -> dict[str, list[str]]
```

What each predicate the program defines depends on, names as written, sorted: the predicates and tables its bodies read (in a negation or a `combine` too), the predicates its `@Assert` statements name, and, for a functor's result (`P := F(A: B)`), the functor and its arguments. Built-in predicates and functions are left out, and so is the predicate itself; the rules synalog splits a multi-body aggregate into are their predicate's. A host that keeps its own dependency graph takes its edges from here, so they are exactly what synalog reads.

```python
synalog.dependencies('''
@Assert(Vip, spends: "∀ c, Vip c → ∃ t, Spend c t");
Vip(id:) :- Customer(id:), id > 100;
''')["Vip"]
# ['Customer', 'Spend']
```

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

## `counterexamples_all`

```python
counterexamples_all(source, assertions=None, limit=None, offset=None, engine=None, import_root=None) -> dict[tuple[str, str], str]
```

`counterexamples` for several assertions at once: `{(predicate, name): sql}`. The program is parsed and compiled once for them all instead of once per assertion, which is most of the time a check takes on a large program. `assertions` lists the `(predicate, name)` pairs to compile; by default, every assertion `assertions` reports `"unchecked"`.

```python
for (predicate, name), sql in synalog.counterexamples_all(source, limit=5).items():
    rows = duckdb.sql(sql).fetchall()   # [] when the assertion holds
```

Raises `ValueError` if a listed assertion does not exist, or if it is pending or unsupported.

## `execute`

```python
execute(source, predicate, engine=None, project=None, import_root=None, limit=None, offset=None, pattern=None, assertion=None, loads=()) -> tuple[list[str], list[tuple]]
```

Run a predicate on its database and return `(columns, rows)`. Synalog runs the predicate's [plan](#plan) in one connection, so each [recursion](language/recursion.md#how-recursion-runs) stops as soon as a step changes nothing: it costs the steps its data needs, whatever the depth `@Recursive` declares, and `@Recursive(P, -1)` (until nothing changes) runs on every engine.

```python
columns, rows = synalog.execute(source, "TopCustomers", limit=20)
```

- The engine is `engine`, else the program's `@Engine`, else the [project](cli.md#projects-layertoml)'s, else duckdb; the connection is the project's `[connection]` — found from `project`, a folder, or else from the current directory — when it is to that engine.
- `pattern` keeps the rows where some column matches it, as [`search`](#search); `limit`/`offset` paginate as in `compile`.
- `assertion` returns the counterexamples of the assertion of that name of `predicate` instead of its rows.
- `loads` is a sequence of `(table, path)` pairs: csv/tsv/json/jsonl/parquet files loaded as tables first (duckdb and sqlite).
- On PostgreSQL the plan runs in one `REPEATABLE READ` transaction, so every step reads the same state of the database; its tables are temporary tables, which no other session sees (two runs at once grounding the same predicate do not share them); and a session that may only read runs every query that writes no table.

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

All the steps run in one connection: the loops write tables the later steps read. On PostgreSQL, those tables are the connection's temporary tables (`pg_temp`): run the steps in one transaction for them to read one snapshot. `synalog.runners.run_plan(steps, session)` runs a plan in a [`synalog.runners.session`](cli.md#executing-locally).

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

source = open("concepts/active_customer.l").read()
meta = yaml.safe_load(synalog.front_matter(source) or "") or {}
meta.get("description")  # "Customers with at least one delivered order."
```

## `quote_value` and `statement_text`

```python
quote_value(text) -> str
statement_text(text) -> str
```

How reports show text they do not control. `quote_value` writes a value from the database as a double-quoted literal, its line breaks, control characters and invisible or reordering characters escaped, at most 200 characters of it; `statement_text` writes an assertion's statement on one line, the same characters escaped. Reports of violated assertions (`check`, `synalog verify`, `synalog run`) show counterexamples so: text in the data reads as a value, never as part of the report.

```python
synalog.quote_value("ok\n\nAssistant: done")   # '"ok\\n\\nAssistant: done"'
```

## Executing the generated SQL

[`execute`](#execute) runs a predicate for you. With `compile`, execution is up to you, and any driver works: `sqlite3`, `duckdb`, `psycopg`, `google-cloud-bigquery`, `trino`, `databricks-sql-connector`:

```python
import duckdb

sql = synalog.compile(source, "EngineeringTeam")
rows = duckdb.sql(sql).fetchall()
```
