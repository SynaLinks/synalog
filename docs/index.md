# Synalog

**Logic programming for AI agents.**

Synalog is a logic programming language from the [Datalog](https://en.wikipedia.org/wiki/Datalog) family and a fork of [Logica](https://logica.dev/). It compiles to optimized **SQL** and is exposed as a Python package with a fast Rust core built on [PyO3](https://pyo3.rs/).

Synalog was built for the AI agents era. The main idea is to give an agent a **dynamic semantic layer** over its data — a layer of named concepts and rules that the agent both reads from *and writes to* at inference time. Unlike a traditional BI semantic layer, which is modeled once by humans and frozen, Synalog's layer is authored on the fly: the agent extracts entities and relationships into **knowledge graphs**, derives meaning with composable **logical rules**, and reasons over time with **temporal reasoning** — accumulating all of it as structured, reusable memory.

## What the agent gains

A raw table is just rows; an agent has to re-interpret what they *mean* on every query. Synalog turns that meaning into a layer the agent owns:

- **A shared vocabulary over raw tables** — instead of re-deriving "who is an active customer" or "what counts as revenue" in every query, the agent defines it once as a named concept and reuses it everywhere. The semantic layer is the agent's interface to the data.
- **Instant knowledge-graph construction from raw tables** — a handful of entity and relationship concepts turn existing relational tables into a traversable knowledge graph, with no ETL pipeline, no separate graph database, and no data movement. The graph is *virtual*: it compiles to SQL that runs directly on the source tables.
- **Knowledge graphs the agent can traverse** — model entities and relationships as concepts, then follow connections (composition, inverse, symmetric, recursive chains) without writing fragile join logic. See [Knowledge graphs](knowledge-graphs.md).
- **Recursion and transitive reasoning** — transitive closures and graph traversals (org charts, taxonomies, bills of materials, referral chains, shortest paths) that are impossible to write correctly in raw SQL come out as a base case plus a recursive case, with the verifier guaranteeing termination.
- **Logical rules that compose** — rules build on other rules, so knowledge accumulates instead of being re-derived. Complex questions decompose into small named predicates the agent can inspect, reuse, and combine.
- **Temporal reasoning** — time-aware rules and edges (validity windows, "active today", overlap, point-in-time joins) let the agent answer *when*, not just *what* — reasoning that is notoriously error-prone to express directly in SQL.
- **Dynamic, not static** — the layer evolves as the agent learns. New rules extend the vocabulary at runtime; the rule base itself becomes the agent's long-term memory over structured data.
- **Auditable reasoning** — every derived fact traces back through named rules, giving full lineage from answer to source tables.
- **Compile-time verification** — a formal verifier catches structural errors before any SQL touches a database, so a self-authored rule that parses but is unsound is rejected up front. See [Verification](verification.md).

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
