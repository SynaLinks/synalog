# Program structure

By convention, a Synalog program is organized into three sections: **tables**, **concepts** and **rules**. Tables map external data sources. Concepts extract entities and relationships from tables. Rules derive new data from concepts.

The `# Tables` / `# Concepts` / `# Rules` headers are plain comments: the compiler does not know about sections, and a program without them compiles identically. The structure is a convention: it is what Synalog-based agent runtimes expect, and it keeps programs composable as rules accumulate. This documentation follows it throughout.

```logica
# Tables: read-only mappings of database tables
Orders(customer_id:, product_id:, amount:, status:) :-
  orders(customer_id:, product_id:, amount:, status:);

# Concepts: extract entities and relationships

@OrderBy(Customer, "customer_id");
Customer(customer_id:) distinct :- Orders(customer_id:);

@OrderBy(Purchased, "customer_id");
Purchased(customer_id:, product_id:) distinct :- Orders(customer_id:, product_id:);

# Rules: derive insights from concepts

@OrderBy(CustomerSpend, "total", "DESC");
CustomerSpend(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);
```

## The three sections

### Tables

Tables map external data and are treated as **read-only**. A database table is referenced by its database name (lowercase, as it exists in the database); the `# Tables` section maps it once to a PascalCase table predicate listing the columns the program may reference, and everything else builds on the predicate:

```logica
TableName(col1:, col2:) :- database_table(col1:, col2:);
```

For self-contained programs, like the examples in this documentation, a table can instead be given as inline facts:

```logica
TableName(col1: "a", col2: 1);
TableName(col1: "b", col2: 2);
```

From Python, where Synalog is meant to be used, including by AI agents, the table just has to exist in the database the SQL runs on. With the program at the top of this page:

```python
import duckdb
import synalog

source = open("program.l").read()
assert synalog.check(source) == []

conn = duckdb.connect()
conn.execute("CREATE TABLE orders AS SELECT * FROM read_csv('orders.csv')")

sql = synalog.compile(source, "CustomerSpend")
rows = conn.execute(sql).fetchall()
```

See [Querying a CSV file](../getting-started.md#querying-a-csv-file) for a complete runnable program that maps a real DuckDB table.

### Concepts

Concepts extract the entities and relationships hidden in tables. By convention:

- Entity concepts are named after the entity: `Customer`, `Product`.
- Relationship concepts are named after the relationship: `Purchased`, `WorksIn`.

See [Knowledge graphs](../knowledge-graphs.md) for the full modeling conventions.

### Rules

Rules derive new data from concepts (and other rules). Rules carry no suffix: `CustomerSpend`, `TopCustomers`.

## Comments and descriptions

- `#` starts a comment.
- `##` starts a **description**, which is attached to the predicate that follows it.

```logica
# This is a plain comment.

## Total revenue per customer, in cents.
CustomerSpend(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);
```

## Front matter

A program file may open with YAML front matter, as in Markdown: a first line `---`, the YAML, and a closing `---` line. It says what the file is, and carries metadata for the tools around your programs (keywords, ownership, ...). Synalog checks that it is well-formed YAML — a syntax error is reported on its line — and reads two keys, both required: `name` is the predicate the file is about — it must be one the file defines and orders with `@OrderBy` — and `description` says what its rows are, in the words someone would search for (see [verification](../verification.md#front-matter)). Other keys are left to the host, and the file parses as if the block were not there, so error line numbers stay those of the file. It must be the very first thing in the file; an opening `---` that is never closed is an error.

```logica
---
name: ActiveCustomer
description: Customers with at least one delivered order.
keywords: [customers, orders]
---
import tables.Orders.Orders;

@OrderBy(ActiveCustomer, "customer_id");
ActiveCustomer(customer_id:) distinct :- Orders(customer_id:, status: "delivered");
```

Imported files may have front matter too. To read it from Python, use [`front_matter`](../python-api.md#front_matter).

## Reuse and compose predicates

The power of logic programming is composition: define a predicate once and build on it everywhere. Avoid recomputing the same expression in multiple rules.

**Bad**: revenue recomputed in every rule that needs it.

**Good**: `CustomerRevenue` defined once, `TopCustomers` builds on it:

```logica
@OrderBy(CustomerRevenue, "customer_id");
CustomerRevenue(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);

@OrderBy(TopCustomers, "total DESC");
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, total:) :- CustomerRevenue(customer_id:, total:);
```

## Imports: compose across files

Composition extends across files: `import` brings one predicate from another program into scope. The path is dotted: `import path.to.file.Pred;` reads the file `path/to/file.l`, and one import statement names exactly one predicate.

With the `CustomerRevenue` metric stored in `lib/metrics.l`:

```logica
@OrderBy(CustomerRevenue, "customer_id");
CustomerRevenue(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);
```

any program can build on it instead of redefining it:

```logica
import lib.metrics.CustomerRevenue;

@OrderBy(TopCustomers, "total DESC");
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, total:) :- CustomerRevenue(customer_id:, total:);
```

Add `as` to rename: `import lib.metrics.CustomerRevenue as Revenue;`. Directives attached to the imported predicate (its `@OrderBy` here) travel with it, and the imported file's own imports are resolved recursively (circular imports are an error).

Import paths resolve against a list of root directories: the current directory by default, the `import_root` argument in the [Python API](../python-api.md), or `--import-root` / the program file's directory in the [CLI](../cli.md#imports).

## Extract categorical values first

For columns like `status`, `type`, `tier`, `category` or `country`, extract the distinct values as a concept *before* writing rules over them. This gives consistency, reuse and discoverability:

```logica
@OrderBy(OrderStatus, "status");
OrderStatus(status:) distinct :- Orders(status:);

@OrderBy(OrdersByStatus, "status");
OrdersByStatus(status:, count? += 1) distinct :- OrderStatus(status:), Orders(status:);
```

!!! warning "Order matters for directives"
    Directives such as `@OrderBy` and `@Limit` must be placed **before** the rule they apply to. `@OrderBy` should be set on every concept and rule; without it, pagination order is non-deterministic. See [Directives](directives.md).

## Complete example

A full program with all three sections: categorical extraction, a reusable revenue rule, and a `TopCustomers` rule composed on top of it:

```logica
--8<-- "docs/examples/program_structure.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/program_structure.log"
    ```
