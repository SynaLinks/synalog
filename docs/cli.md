# CLI interface

Installing the package also installs a `synalog` command (also available as `python -m synalog`). Run `synalog --help` for the full usage.

If you use [uv](https://docs.astral.sh/uv/), `uvx` runs the CLI in an ephemeral environment without installing anything:

```bash
uvx synalog                                            # interactive session
uvx --from 'synalog[run]' synalog program.l run Total  # adds the psycopg (psql) driver
```

Plain `uvx synalog` covers `parse`, `check`, `print` and execution on duckdb (the default engine, bundled with synalog) and sqlite (Python's built-in driver); executing on PostgreSQL needs the psycopg driver from the `synalog[run]` extra, hence `--from`.

## One-shot commands

The argument order follows `logica`: the program file first, then the command.

```bash
synalog program.l parse                     # print the AST as JSON
synalog program.l check                     # validate; exit 1 on errors
synalog program.l print Predicate ...      # print compiled SQL
synalog program.l run Predicate ...        # execute and print a table
synalog program.l run Predicate --csv      # execute and print CSV
```

`print` and `run` accept several predicate names and process them in order. In a terminal, `print` highlights the SQL and `run` renders the table with rich formatting; piped output falls back to plain text. Add `--csv` to `run` for machine-readable CSV instead of the rendered table.

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
| `--engine <name>` | Target SQL dialect. Resolution order: this flag, then the program's `@Engine` annotation, then `duckdb`. |
| `--limit N` / `--offset N` | Paginate the result. |
| `--csv` | With `run`: print results as CSV instead of a rendered table. |
| `--search REGEX` | With `print`/`run`: keep only rows where some column matches the regular expression `REGEX` (engine-native regex, not a SQL `LIKE` pattern). Applies to the filtered rows before pagination. |
| `--import-root DIR` | Directory where `import` statements look up `.l` files (repeatable). |
| `--load TABLE=PATH` | Load a csv/tsv/json/jsonl/parquet file as a table before running (repeatable). |
| `--dsn <conninfo>` | PostgreSQL connection string for `--engine psql` (or set `SYNALOG_PSQL_DSN`). |

Passing `-` as the file reads the program from stdin, and `-c` takes the program text directly — both compose with the other options:

```bash
echo 'Greeting("hi");' | synalog - print Greeting
synalog -c 'Greeting("hi");' run Greeting
synalog -c 'Digit(d) :- d in [1, 2, 3];' run Digit --limit 2 --offset 1
```

With `-c` there is no `FILE` argument: the positionals are the command and its predicates.

### Executing locally

`run` (optionally with `--csv`) executes the compiled SQL in-process:

- **duckdb** — the default engine, bundled with synalog; nothing extra to install.
- **sqlite** — Python's stdlib driver; Logica's runtime UDFs (ArgMin/ArgMax, ARRAY_CONCAT, ...) are registered when the `logica` package is installed.
- **psql** — needs `pip install psycopg` and a connection string.

The [`Today` and `Now`](language/temporal.md) built-in concepts need no runner support — the compiler inlines them per dialect, so they work on every engine.

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

duckdb ships with synalog; `pip install 'synalog[run]'` adds the psycopg driver for PostgreSQL. For the other engines (`bigquery`, `trino`, `presto`, `databricks`), use `print` and run the SQL with your own client.

### Imports

`import path.to.file.Pred;` statements resolve `path/to/file.l` against the program file's directory, then the current directory. Pass `--import-root DIR` (repeatable) to search elsewhere; explicit roots replace the defaults.

For example, with a reusable metric in `lib/metrics.l`:

```logica
@OrderBy(RegionTotal, "region");
RegionTotal(region:, total? += amount) distinct :- sales(region:, amount:);
```

a program next to the `lib/` directory imports it by its dotted path and builds on it:

```logica
# report.l
import lib.metrics.RegionTotal;

@OrderBy(TopRegion, "total DESC");
@Limit(TopRegion, 1);
TopRegion(region:, total:) :- RegionTotal(region:, total:);
```

```console
$ synalog report.l run TopRegion --load sales=sales.csv
+--------+-------+
| region | total |
+--------+-------+
| south  | 20    |
+--------+-------+
1 row
```

`import lib.metrics.RegionTotal as Totals;` imports the same predicate under another name. Directives attached to an imported predicate (its `@OrderBy` here) travel with it.

### Errors

Errors go to stderr (shown in red in a terminal) and exit with code 1; usage mistakes (unknown option, missing argument) exit with code 2. There are three layers, surfaced in the order the program is processed:

**Syntax errors** come from the parser. Every command reports them the same way, quoting the offending statement with a marker at the position where parsing stopped:

```console
$ synalog -c 'Bad(x) :- x ==;' check
Parsing:
Bad(x) :- x ==<EMPTY>

[ Error ] Could not parse expression of a value.
$ echo $?
1
```

**Verification errors** come from `check`, which runs the structural [verifier](verification.md) and reports *all* problems at once, one per line:

```console
$ synalog -c 'A(x:, y:) :- B(x:);
C(z:) :- D(w:);' check
Unbound variable 'y' in head of rule: A(x:, y:) :- B(x:)
Unbound variable 'z' in head of rule: C(z:) :- D(w:)
```

**Compile errors** come from `print` and `run` when SQL generation fails — for example when the requested predicate does not exist:

```console
$ synalog -c 'Greeting("hi");' run Missing
Compile error: No rules are defining 'Missing', but compilation was requested.
```

A failing program never produces partial output: `run` either prints the table or the error.

## Starting a project

`synalog init` scaffolds a project directory (`uvx synalog init` runs it without installing). It asks for a name and a description, then creates the files a coding agent needs to work with Synalog:

```console
$ synalog init
Project name [synalog-project]: demo-kb
Description [A Synalog knowledge base]: Sales analytics for the demo team
Created demo-kb/
  .agents/skills/synalog/SKILL.md
  .gitignore
  AGENTS.md
  CLAUDE.md
  data/sales.csv
  example.l
  lib/metrics.l

Next steps:
  cd demo-kb
  synalog example.l run TopRegion MonthlySales --load sales=data/sales.csv
```

- `.agents/skills/synalog/SKILL.md` — an agent skill with the Synalog language reference, CLI usage and conventions, so coding agents know how to write and run programs.
- `AGENTS.md` — project instructions (name, description, layout, workflow) pointing to the skill; `CLAUDE.md` imports it for Claude Code.
- `example.l`, `lib/metrics.l` and `data/sales.csv` — a working starter: a program that imports a reusable metric from a `lib/` module and runs over the sample data.
- `data/` — where source data files (csv, tsv, json, jsonl, parquet) live, loaded with `--load`.

`synalog init NAME` skips the name prompt. The command refuses to overwrite an existing directory.

## Interactive session

Running `synalog` with no arguments starts a REPL, in the spirit of `python`:

```console
$ synalog
Synalog 0.1.0 on duckdb — type .help for help
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

Type a rule ending in `;` to add it to the session program — it is validated first and rejected with an error if invalid, leaving the program untouched. A statement can span several lines: the prompt switches to `...` until the closing `;`. Type a predicate name to compile and run it.

Errors never end the session — the offending input is simply not added, as `.show` confirms:

```console
>>> Greeting("hi");
>>> Bad(x) :- x ==;
Parsing:
Bad(x) :- x ==<EMPTY>

[ Error ] Could not parse expression of a value.
>>> .show
Greeting("hi");
```

The `--engine`, `--dsn`, `--import-root` and `--load` options also apply to the session:

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
