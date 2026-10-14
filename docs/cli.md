# CLI interface

Installing the package also installs a `synalog` command (also available as `python -m synalog`). Run `synalog --help` for the full usage.

If you use [uv](https://docs.astral.sh/uv/), `uvx` runs the CLI in an ephemeral environment without installing anything:

```bash
uvx synalog                          # interactive session
uvx synalog program.l run Total      # on duckdb, the default engine
```

`uvx synalog` covers `print` and execution on duckdb (the default engine), sqlite (Python's built-in driver) and PostgreSQL: synalog depends on duckdb and on psycopg with its bundled libpq, so nothing else is needed on macOS or Linux.

## One-shot commands

The argument order follows `logica`: the program file first, then the command.

```bash
synalog program.l print Predicate ...      # print compiled SQL
synalog program.l run Predicate ...        # execute and print a table
synalog program.l run Predicate --csv      # execute and print CSV
synalog program.l verify [Predicate ...]   # check the @Assert statements
```

`print`, `run` and `verify` validate the whole program first and exit 1 with the verifier's errors if it is invalid, so there is no separate `check` step to forget. Verifier warnings, such as an [assertion](assertions.md) that cannot be checked, are printed to stderr and do not stop the command. `run` also checks the program's assertions against the database and exits 1, printing a few counterexamples, if one is violated; `print` stays offline. `print` and `run` accept several predicate names and process them in order. In a terminal, `print` highlights the SQL and `run` renders the table with rich formatting; piped output falls back to plain text. Add `--csv` to `run` for machine-readable CSV instead of the rendered table.

`verify` runs every [assertion](assertions.md) of the program, or only those of the given predicates, against the database. It prints the counterexamples of each assertion that does not hold (5 by default, `--limit` to change) and exits 1 if any assertion is violated. Assertions that are pending or cannot be checked are listed and skipped.

```console
$ synalog family.l verify
✓ Ancestor.transitive holds
✗ Near.transitive is violated: ∀ x y z, Near x y → Near y z → Near x z
  2 counterexamples:
+---+---+---+
| x | y | z |
+---+---+---+
| a | b | d |
| a | c | d |
+---+---+---+
```

```console
$ synalog program.l run EngineeringTeam
+---------+--------+
| name    | salary |
+---------+--------+
| Alice   | 75000  |
| Charlie | 80000  |
+---------+--------+
2 rows
```

### Options

| Option | Meaning |
| --- | --- |
| `-c PROGRAM` | Pass the program text inline instead of `FILE`, like `python -c`. |
| `--engine <name>` | Target SQL dialect. Resolution order: this flag, then the program's `@Engine` annotation, then the project's engine, then `duckdb`. |
| `--limit N` / `--offset N` | Paginate the result. |
| `--csv` | With `run`: print results as CSV instead of a rendered table. |
| `--search REGEX` | With `print`/`run`: keep only rows where some column matches the regular expression `REGEX` (engine-native regex, not a SQL `LIKE` pattern). Applies to the filtered rows before pagination. |
| `--import-root DIR` | Directory where `import` statements look up `.l` files (repeatable). |
| `--load TABLE=PATH` | Load a csv/tsv/json/jsonl/parquet file as a table before running (repeatable). |

Passing `-` as the file reads the program from stdin, and `-c` takes the program text directly, and both compose with the other options:

```bash
echo 'Greeting("hi");' | synalog - print Greeting
synalog -c 'Greeting("hi");' run Greeting
synalog -c 'Digit(d) :- d in [1, 2, 3];' run Digit --limit 2 --offset 1
```

With `-c` there is no `FILE` argument: the positionals are the command and its predicates.

### Executing locally

`run` (optionally with `--csv`) executes the compiled SQL in-process:

- **duckdb**: the default engine, bundled with synalog; nothing extra to install.
- **sqlite**: Python's stdlib driver; Logica's runtime UDFs (ArgMin/ArgMax, ARRAY_CONCAT, ...) are registered when the `logica` package is installed.
- **psql**: bundled with synalog (psycopg with its own libpq); runs in a [project](#projects-layertoml) connected to PostgreSQL.

The [`Today` and `Now`](language/temporal.md) built-in concepts need no runner support, since the compiler inlines them per dialect, so they work on every engine.

Since connections are in-memory and per-run, `--load` is how you bring data in: each `TABLE=PATH` pair is loaded before the script runs, and the program refers to it by the table name. duckdb reads csv/tsv/json/jsonl/parquet natively; the sqlite runner parses csv/tsv/json/jsonl in Python (no parquet); the psql runner cannot load files.

```console
$ synalog totals.l run Total --load sales=sales.csv
+--------+-------+
| region | total |
+--------+-------+
| north  | 15    |
| south  | 20    |
+--------+-------+
2 rows
```

duckdb and the PostgreSQL driver ship with synalog. For the other engines (`bigquery`, `trino`, `presto`, `databricks`), install their driver (`pip install 'synalog[trino]'`, ...) or use `print` and run the SQL with your own client.

### Imports

In a project, `import <folder>.<Name>.<Name>;` statements resolve from the project's folder (the one holding `layer.toml`), whichever file runs and wherever from: `import tables.Orders.Orders;` reads the project's `tables/Orders.l`. The program file's directory and the current directory come next. Pass `--import-root DIR` (repeatable) to search elsewhere; explicit roots replace the defaults.

In the [`shop` project](language/index.md), `rules/TopCustomers.l` builds on `rules/CustomerRevenue.l`:

```synalog
--8<-- "docs/examples/shop/rules/TopCustomers.l"
```

```console
$ synalog rules/TopCustomers.l run TopCustomers --load orders=data/orders.csv
+-------------+-------+
| customer_id | total |
+-------------+-------+
| 100         | 1450  |
| 300         | 430   |
+-------------+-------+
2 rows
```

`import rules.CustomerRevenue.CustomerRevenue as Revenue;` imports the same predicate under another name. Directives attached to an imported predicate (its `@OrderBy` here) travel with it.

### Errors

Errors go to stderr (shown in red in a terminal) and exit with code 1; usage mistakes (unknown option, missing argument) exit with code 2. There are three layers, surfaced in the order the program is processed:

**Syntax errors** come from the parser. Both commands report them the same way, quoting the offending statement with a marker at the position where parsing stopped:

```console
$ synalog -c 'Bad(x) :- x ==;' print Bad
Parsing:
Bad(x) :- x ==<EMPTY>

[ Error ] Could not parse expression of a value.
$ echo $?
1
```

**Verification errors** come from the formal [verifier](verification.md), which `print` and `run` run over the whole program before compiling, reporting *all* problems at once, one per line:

```console
$ synalog -c 'A(x:, y:) :- B(x:);
C(z:) :- D(w:);' print A
Unbound variable 'y' in head of rule: A(x:, y:) :- B(x:)
Unbound variable 'z' in head of rule: C(z:) :- D(w:)
```

**Compile errors** come from `print` and `run` when SQL generation fails, for example when the requested predicate does not exist:

```console
$ synalog -c 'Greeting("hi");' run Missing
Compile error: No rules are defining 'Missing', but compilation was requested.
```

A failing program never produces partial output: `run` either prints the table or the error.

## Projects: `layer.toml`

A Synalog program is a [project](language/index.md): a folder with a `layer.toml`, its predicates in `tables/`, `concepts/` and `rules/`, one per file. The file names and describes the project, and its `[connection]` says which database it runs on, as plain fields — commit it:

```toml
[project]
name = "sales"
description = "Orders and customers: revenue, active customers, countries."

[connection]
engine = "psql"
host = "db.example.com"
port = 5432
database = "sales"
user = "analyst"
schema = "public"
```

Secrets never go in the file (synalog refuses it): each comes from the environment as `SYNALOG_<ENGINE>_<FIELD>` — `SYNALOG_PSQL_PASSWORD`, `SYNALOG_DATABRICKS_ACCESS_TOKEN`, or `GOOGLE_APPLICATION_CREDENTIALS` for BigQuery — usually from the project's `.env`, kept out of git. Anywhere in the project, `run`, `print`, `verify` and `introspect` use that engine and connection, and [imports](#imports) resolve from the project's folder. The project's file is the only place a connection comes from: `--engine` and an `@Engine` annotation choose the dialect, and a remote engine runs only through the project's connection to it. The fields of every engine are in `synalog.project.ENGINES`.

### Connect

```console
$ synalog connect psql host=db.example.com database=sales user=analyst password=...
Connected /path/to/sales/layer.toml to psql (secrets in .env)
$ synalog connect
/path/to/sales/layer.toml
  engine = psql
  host = db.example.com
  ...
  password: SYNALOG_PSQL_PASSWORD set
```

`synalog connect <engine> key=value ...` writes it — the non-secret fields to `layer.toml`, the secret ones to `.env` — `synalog connect` shows it (secrets hidden), `synalog connect clear` removes it. It runs in the project's folder — the nearest `layer.toml`'s, else the current directory — keeps the file's other tables, adds `.env` to `.gitignore`, and writes nothing when a required field is missing.

### Introspect

`synalog introspect` reads the database's schema and writes the project's `tables/`: one file per table, `tables/<Schema><Table>.l`, mapping the table to a predicate ordered by its first column, with a description made from the table's name (`public.order_items` → "Order items.") until someone writes a better one.

```console
$ synalog introspect
Wrote 2 table file(s) to /path/to/sales/tables
```

```synalog
---
name: PublicOrders
description: Orders.
---
@OrderBy(PublicOrders, "order_id");
PublicOrders(order_id:, customer_id:, amount:, status:) :- public.orders(order_id:, customer_id:, amount:, status:);
```

Run it again when the schema changes: the declarations are regenerated, and a file's front matter (its description, keywords, ...) is kept as written. A table the database no longer has keeps its file, since concepts may import it, and is listed. It needs a project connected to its database. PostgreSQL, Trino, Presto, Databricks and BigQuery can be introspected.

## Add the skill to your coding agent

Synalog ships an [Agent Skill](https://agentskills.io): a `SKILL.md` that teaches a coding agent the language, the CLI and the conventions, so it can write and run programs correctly. The skill follows the open Agent Skills standard, so it works with Claude Code, Cursor, Codex, OpenCode, Cline, Windsurf and many other agents.

Install it with the [`skills`](https://www.npmjs.com/package/skills) CLI (GitHub is the registry, so there is nothing to publish or install first):

```console
$ npx skills add SynaLinks/synalog               # this project (./.claude/skills, ./.agents/skills, …)
$ npx skills add SynaLinks/synalog -g            # user-wide (~/.claude/skills, …)
$ npx skills add SynaLinks/synalog -a cursor codex   # only specific agents
```

The skill is maintained in the repository at [`skills/synalog/SKILL.md`](https://github.com/SynaLinks/synalog/blob/main/skills/synalog/SKILL.md); `npx skills add` copies it into the right location for each agent.

## Interactive session

Running `synalog` with no arguments starts a REPL, in the spirit of `python`:

```console
$ synalog
Synalog 0.1.0 on duckdb, type .help for help
>>> Employee(name: "Alice", salary: 75000);
>>> Employee(name: "Bob", salary: 65000);
>>> Total(t? += salary) distinct :- Employee(salary:);
>>> Total
+--------+
| t      |
+--------+
| 140000 |
+--------+
1 row
```

Type a rule ending in `;` to add it to the session program. It is validated first and rejected with an error if invalid, leaving the program untouched. A statement can span several lines: the prompt switches to `...` until the closing `;`. Type a predicate name to compile and run it.

Errors never end the session: the offending input is simply not added, as `.show` confirms:

```console
>>> Greeting("hi");
>>> Bad(x) :- x ==;
Parsing:
Bad(x) :- x ==<EMPTY>

[ Error ] Could not parse expression of a value.
>>> .show
Greeting("hi");
```

The `--engine`, `--import-root` and `--load` options also apply to the session, and the project's connection too:

```bash
synalog --engine sqlite --load employees=employees.csv
```

Session commands:

| Command | Meaning |
| --- | --- |
| `.help` | Show help. |
| `.show` | Show the current program. |
| `.sql <Pred>` | Print the SQL compiled for a predicate. |
| `.search <Pred> <regex>` | Run `<Pred>`, keeping only rows where some column matches the regular expression. |
| `.engine <name>` | Switch engine. |
| `.load <table> <path>` | Load a csv/tsv/json/jsonl/parquet file as a table. |
| `.clear` | Discard the program and loaded tables. |
| `.exit` | Leave (also `.quit` or ++ctrl+d++). |
