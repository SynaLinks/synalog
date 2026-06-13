# Synalog

**Logic programming for AI agents.**

Synalog is a logic programming language from the [Datalog](https://en.wikipedia.org/wiki/Datalog) family and a fork of [Logica](https://logica.dev/). It compiles to optimized **SQL** and is exposed as a Python package with a fast Rust core built on [PyO3](https://pyo3.rs/).

Synalog was built for the AI agents era. The main idea is to bring the benefits of logic programming — in particular **composability** — to agents that reason over tables: rules are reusable, complex queries decompose into small named predicates, and an agent can accumulate rules over time as a form of structured memory.

## Why Synalog?

In practice, this is what an agent unlocks with Synalog:

- **Auditable reasoning** — every derived fact traces back through named rules, giving full lineage from answer to source tables.
- **Composability** — rules build on other rules, so knowledge accumulates instead of being re-derived in every query.
- **Memory as a program** — the rule base itself is the agent's long-term memory over structured data.
- **Recursion done right** — transitive closures and graph traversals that would be impossible to write correctly in raw SQL.
- **Compile-time verification** — a formal verifier catches structural errors before any SQL touches a database. See [Verification](verification.md).

Because SQL engines are better optimized than logic programming engines, Synalog compiles into *optimized SQL* that runs on **SQLite**, **DuckDB**, **BigQuery**, **PostgreSQL**, **Presto**, **Trino** and **Databricks** — efficiently scaling to *petabytes of data*. See [Supported engines](engines.md).

## At a glance

```python
import duckdb
import synalog

source = """
@Engine("duckdb");

Employee(name: "Alice", department: "Engineering", salary: 75000);
Employee(name: "Bob", department: "Marketing", salary: 65000);
Employee(name: "Charlie", department: "Engineering", salary: 80000);

@OrderBy(EngineeringTeam, "name");
EngineeringTeam(name:, salary:) :- Employee(name:, department: "Engineering", salary:);
"""

errors = synalog.check(source)
assert errors == []

sql = synalog.compile(source, "EngineeringTeam")
rows = duckdb.sql(sql).fetchall()
# [('Alice', 75000), ('Charlie', 80000)]
```

## Where to go next

- [Getting started](getting-started.md) — install Synalog and run your first program.
- [Language](language/index.md) — the full language reference.
- [Knowledge graphs](knowledge-graphs.md) — model entities and relationships as nodes and edges.
- [Python API](python-api.md) — `parse`, `compile`, `compile_all`, `check`.
- [CLI interface](cli.md) — the `synalog` command and the interactive session.
- [Differences with Datalog](differences-datalog.md) — how Synalog departs from classical Datalog.
- [Differences with Logica](differences.md) — what Synalog changes and why.
