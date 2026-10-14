# Program structure

A Synalog program is a **project**: a folder with a `layer.toml`, holding one predicate per file in three folders. This is the layout of [semantic layers](https://github.com/SynaLinks/semantic-layers), and the one this documentation follows.

```
shop/
├── tables/           # the data: one file per database table
│   └── Orders.l
├── concepts/         # what the data is about: entities, relationships, clean views
│   ├── Customer.l
│   └── OrderStatus.l
├── rules/            # what you want to know: counts, rates, rankings
│   ├── CustomerRevenue.l
│   ├── OrdersByStatus.l
│   └── TopCustomers.l
└── layer.toml        # the project's name, description and database
```

A predicate's kind is the folder it is in:

| Folder | Holds |
|---|---|
| `tables/` | the data: each file maps one database table to a predicate |
| `concepts/` | entities and relationships extracted from tables (`Customer`, `Purchased`), and views that filter tables or rename messy columns |
| `rules/` | insights derived from concepts and other rules: counts, rates, rankings, trends |

## A file, a predicate

Each file is named after the predicate it defines, `<folder>/<Name>.l`, and holds, in this order:

1. its [front matter](#front-matter): `name`, the predicate, and `description`, what its rows are;
2. one `import` per predicate it builds on, by folder, file and predicate: `import tables.Orders.Orders;`;
3. the predicate's rules, after its directives. Every predicate is ordered with [`@OrderBy`](directives.md#orderby): results are paginated, and without a stable order a page differs between calls.

`rules/TopCustomers.l` builds on `rules/CustomerRevenue.l`, which builds on a concept and a table:

```synalog
--8<-- "docs/examples/shop/rules/CustomerRevenue.l"
```

```synalog
--8<-- "docs/examples/shop/rules/TopCustomers.l"
```

A file may also define the intermediate rules its predicate is built from (a recursive relation, a staging join): they are private to the file. A step worth reusing belongs in its own file, with its own name and description.

### Tables

A table file maps one database table, referenced by its database name (lowercase, as it exists in the database), to a PascalCase predicate listing the columns the project may reference; everything else builds on the predicate:

```synalog
--8<-- "docs/examples/shop/tables/Orders.l"
```

Table files are generated from the database's schema: [`synalog introspect`](../cli.md#introspect) writes one per table, ordered by its first column, with a description made from its name until someone writes a better one, and keeps the front matter written by hand when it runs again.

### Concepts

Concepts extract the entities and relationships hidden in tables:

- Entity concepts are named after the entity: `Customer`, `Product`.
- Relationship concepts are named after the relationship: `Purchased`, `WorksIn`.

```synalog
--8<-- "docs/examples/shop/concepts/Customer.l"
```

See [Knowledge graphs](../knowledge-graphs.md) for the full modeling conventions.

### Rules

Rules derive what you want to know from concepts and other rules. They carry no suffix: `CustomerRevenue`, `TopCustomers`.

## Running a project

Imports resolve from the project's folder, so every file runs on its own, from anywhere in the project:

```bash
synalog rules/TopCustomers.l run TopCustomers
```

The project's `layer.toml` says which database it runs on (see [Projects](../cli.md#projects-layertoml)). From Python, give the project's folder as the import root:

```python
import synalog

source = open("shop/rules/TopCustomers.l").read()
errors, warnings = synalog.check(source, import_root=["shop"])
assert errors == []
sql = synalog.compile(source, "TopCustomers", import_root=["shop"])
```

??? example "Every file of the `shop` project, run on its data"

    ```text
    --8<-- "docs/examples/shop.log"
    ```

To try the language without a database, a single file can hold its own data as inline facts, as the examples of this documentation do:

```synalog
Orders(order_id: 1, customer_id: 100, amount: 250, status: "shipped");
Orders(order_id: 2, customer_id: 100, amount: 1200, status: "pending");
```

## Comments

`#` starts a comment, to the end of the line. What a predicate holds is said in its file's front matter, as its `description`.

## Front matter

Every file opens with YAML front matter, as in Markdown: a first line `---`, the YAML, and a closing `---` line. It says what the file is, and carries metadata for the tools around your project (keywords, ownership, ...). Synalog checks that it is well-formed YAML — a syntax error is reported on its line — and reads two keys, both required: `name` is the predicate the file is about — it must be one the file defines and orders with `@OrderBy` — and `description` says what its rows are, in the words someone would search for (see [verification](../verification.md#front-matter)). Other keys are left to the host (`keywords`, `locked`, ...), and the file parses as if the block were not there, so error line numbers stay those of the file. It must be the very first thing in the file; an opening `---` that is never closed is an error.

```synalog
--8<-- "docs/examples/shop/concepts/Customer.l"
```

To read it from Python, use [`front_matter`](../python-api.md#front_matter).

## Reuse and compose predicates

The power of logic programming is composition: define a predicate once, in its own file, and build on it everywhere. Never recompute the same expression in several rules: `CustomerRevenue` is defined once, and `TopCustomers` imports it (both files are above).

## Imports

`import` brings one predicate of another file into scope: `import <folder>.<Name>.<Name>;` reads the project's `<folder>/<Name>.l` and names its predicate. One import statement names exactly one predicate; every import must be used.

```synalog
import concepts.Customer.Customer;
import tables.Orders.Orders;
```

Add `as` to rename: `import rules.CustomerRevenue.CustomerRevenue as Revenue;`. Directives attached to the imported predicate (its `@OrderBy`) travel with it, and the imported file's own imports are resolved recursively (circular imports are an error).

The imports are the project's dependency graph: what each predicate builds on, and so what a change affects. A project is self-contained: everything its files import is inside it, its tables included.

Imports resolve from the project's folder (the one holding `layer.toml`) in the [CLI](../cli.md#imports), whichever file runs and wherever from; in the [Python API](../python-api.md), pass that folder as `import_root`.

## Extract categorical values first

For columns like `status`, `type`, `tier`, `category` or `country`, extract the distinct values as a concept *before* writing rules over them. This gives consistency, reuse and discoverability:

```synalog
--8<-- "docs/examples/shop/concepts/OrderStatus.l"
```

```synalog
--8<-- "docs/examples/shop/rules/OrdersByStatus.l"
```

!!! warning "Order matters for directives"
    Directives such as `@OrderBy` and `@Limit` must be placed **before** the rule they apply to. `@OrderBy` is required on the predicate a file names; without it, pagination order is non-deterministic. See [Directives](directives.md).
