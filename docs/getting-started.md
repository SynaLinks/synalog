# Getting started

## Installation

```bash
pip install synalog
```

Or with [uv](https://docs.astral.sh/uv/):

```bash
uv add synalog          # add it to a uv-managed project
uv pip install synalog  # or install into the current virtualenv
```

Requires Python 3.10+. Wheels are published for Linux (x86_64, aarch64, armv7, s390x, ppc64le; glibc and musl), Windows (x64, x86, aarch64) and macOS (x86_64, aarch64).

duckdb (the default engine), sqlite and PostgreSQL work out of the box: synalog depends on duckdb and on psycopg with its bundled libpq, so nothing else is needed on macOS or Linux.

## Your first program

A Synalog project maps **tables** (the data), defines **concepts** (entities and relationships extracted from tables) and writes **rules** (what you want to know), one predicate per file (see [Program structure](language/index.md)). You compile a predicate to SQL and run it with any database driver. To start, a single program can hold its own data as facts:

```python
import synalog

source = """
@Engine("duckdb");

Employee(name: "Alice", department: "Engineering", salary: 75000);
Employee(name: "Bob", department: "Marketing", salary: 65000);
Employee(name: "Charlie", department: "Engineering", salary: 80000);

@OrderBy(EngineeringTeam, "name");
EngineeringTeam(name:, salary:) :- Employee(name:, department: "Engineering", salary:);
"""

# 1. Validate the program: returns a list of error messages
errors, warnings = synalog.check(source)
assert errors == []

# 2. Compile a predicate to SQL
sql = synalog.compile(source, "EngineeringTeam")
print(sql)
```

Output (the DuckDB initialization preamble is omitted here; the [complete example](#complete-example) below shows the full, unedited output):

```sql
WITH t_0_Employee AS (SELECT * FROM (
    SELECT
      'Alice' AS name,
      'Engineering' AS department,
      75000 AS salary
   UNION ALL
    SELECT
      'Bob' AS name,
      'Marketing' AS department,
      65000 AS salary
   UNION ALL
    SELECT
      'Charlie' AS name,
      'Engineering' AS department,
      80000 AS salary
) AS UNUSED_TABLE_NAME  )
SELECT
  Employee.name AS name,
  Employee.salary AS salary
FROM
  t_0_Employee AS Employee
WHERE
  (Employee.department = 'Engineering') ORDER BY name;
```

Inline facts compile to a `WITH` clause; a real database table compiles to a plain `FROM` over that table, as in [Querying a CSV file](#querying-a-csv-file) below.

## Executing the SQL

Synalog produces plain SQL strings, so you can execute them with any driver for your engine: `sqlite3`, `duckdb`, `psycopg`, `google-cloud-bigquery`, and so on:

```python
import duckdb

result = duckdb.sql(sql).fetchall()
print(result)
# [('Alice', 75000), ('Charlie', 80000)]
```

## The CLI

Everything above also works without writing Python. Installing the package installs a `synalog` command that validates, compiles and runs predicates in one step. `run` (and `print`) verify the whole program first and stop with the verifier's errors if it is invalid:

```bash
synalog program.l run EngineeringTeam
```

Running `synalog` with no arguments starts an interactive session where you build a program rule by rule and query it as you go. With uv, `uvx` runs the CLI without installing anything: `uvx synalog program.l run EngineeringTeam` (duckdb and the PostgreSQL driver are bundled). See [CLI interface](cli.md).

### Add the skill to your coding agent

Synalog ships an [Agent Skill](https://agentskills.io), a `SKILL.md` that teaches a coding agent the language, the CLI and the conventions. It follows the open Agent Skills standard, so it works with Claude Code, Cursor, Codex, OpenCode and many other agents. Install it with the [`skills`](https://www.npmjs.com/package/skills) CLI (GitHub is the registry, so there is nothing to publish or install first):

```console
$ npx skills add SynaLinks/synalog        # this project
$ npx skills add SynaLinks/synalog -g     # user-wide, across all projects
```

Then lay out the project as [tables, concepts and rules](language/index.md), one predicate per file. See [Add the skill to your coding agent](cli.md#add-the-skill-to-your-coding-agent) for the per-agent options.

## Querying a CSV file

Real data lives in files or database tables, not inline facts. Here it is a small smoke-test dataset, in the `smoke` project:

```csv
--8<-- "docs/examples/smoke/data/smoke_tests.csv"
```

```
smoke/
├── data/smoke_tests.csv
├── tables/SmokeTests.l
├── concepts/Device.l
├── concepts/TestStatus.l
├── rules/FailuresByDevice.l
├── rules/RunsPerDay.l
└── synalog.toml
```

The table file maps the database table `smoke_tests`, referenced by its lowercase database name, to the `SmokeTests` predicate; everything else builds on it:

```logica
--8<-- "docs/examples/smoke/tables/SmokeTests.l"
```

A concept extracts the devices, and a rule counts the failures of each, importing both:

```logica
--8<-- "docs/examples/smoke/concepts/Device.l"
```

```logica
--8<-- "docs/examples/smoke/rules/FailuresByDevice.l"
```

From the project's folder, the CLI loads the CSV as the `smoke_tests` table and runs the rule:

```console
$ synalog rules/FailuresByDevice.l run FailuresByDevice --load smoke_tests=data/smoke_tests.csv
```

From Python, load it into DuckDB and give the project's folder as the import root:

```python
import duckdb
import synalog

conn = duckdb.connect()
conn.execute("CREATE TABLE smoke_tests AS SELECT * FROM read_csv('smoke/data/smoke_tests.csv')")

source = open("smoke/rules/FailuresByDevice.l").read()
errors, warnings = synalog.check(source, import_root=["smoke"])
assert errors == []

sql = synalog.compile(source, "FailuresByDevice", import_root=["smoke"])
print(conn.execute(sql).fetchall())
# [('gateway', 2), ('sensor-a', 1)]
```

`rules/RunsPerDay.l` counts the runs per day through the [temporal pipeline](language/temporal.md) (`ToString` → `Substr`) on the `run_at` timestamp.

??? example "Every file of the `smoke` project, run on its data"

    ```text
    --8<-- "docs/examples/smoke.log"
    ```

## Pagination

AI agents have limited context windows, so Synalog supports pagination at compile time via the `limit` and `offset` arguments:

```python
sql = synalog.compile(source, "EngineeringTeam", limit=20, offset=40)
```

The limit combines with the [`@Limit` directive](language/directives.md): the effective limit is `min(limit, @Limit)`.

!!! tip "Always set `@OrderBy`"
    Pagination is only deterministic when results have a stable sort order. Put an `@OrderBy` directive on every concept and rule.

## Choosing an engine

The target SQL dialect is set with the `@Engine` annotation in the program, or overridden with the `engine` keyword of the [Python API](python-api.md) functions:

```python
sql = synalog.compile(source, "EngineeringTeam", engine="psql")
```

Valid engines: `sqlite`, `duckdb` (default), `bigquery`, `psql`, `presto`, `trino`, `databricks`. See [Supported engines](engines.md).

## Complete example

The same program as a standalone `.l` file, with the SQL it compiles to and the rows it returns on DuckDB:

```logica
--8<-- "docs/examples/getting_started.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/getting_started.log"
    ```

## Next steps

- Learn the [program structure](language/index.md) and the [syntax](language/syntax.md).
- Model your data as a [knowledge graph](knowledge-graphs.md).
- Explore the complete [Python API](python-api.md).
- Run and explore programs with the [CLI interface](cli.md).
