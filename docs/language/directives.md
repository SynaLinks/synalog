# Directives

Directives control predicate behavior. They **must be placed before** the rule definition they apply to.

```logica
@OrderBy(TopCustomers, "total", "DESC");
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);
```

| Directive | Purpose |
|-----------|---------|
| `@OrderBy(Pred, "col1", ...)` | Sort order. Append `"DESC"` for descending. |
| `@Limit(Pred, n)` | Maximum number of rows. |
| `@Recursive(Pred, n)` | Allow recursion with an iteration limit. See [Recursion](recursion.md). |
| `@Ground(Pred)` | Force materialization before dependents (performance). |
| `@Engine(name)` | Target SQL engine. See [Supported engines](../engines.md). |
| `@Assert(Pred, name: "statement")` | State a property the predicate must satisfy. See [Assertions](../assertions.md). |

## `@OrderBy`

```logica
@OrderBy(Stats, "category");
@OrderBy(TopCustomers, "total", "DESC");
```

Each item is a column of the predicate, optionally followed by `ASC` or `DESC` and by `NULLS FIRST` or `NULLS LAST` (in any case): `"total DESC"`, `"name"`, `"score desc nulls last"`. Anything else, such as an expression (`"x * 2"`), is refused by both the verifier and the compiler, since the item is written into the SQL's `ORDER BY`. To order by a computed value, compute it in a column of the rule.

!!! warning "`@OrderBy` is mandatory in practice"
    Put `@OrderBy` on **every concept and rule**. Without a stable sort order, pagination (`limit`/`offset` in [`compile()`](../python-api.md#compile)) returns rows in a non-deterministic order between calls.

## `@Limit`

```logica
@Limit(TopCustomers, 10);
```

The limit is a whole number of rows, 0 or more. It is part of what the predicate holds: a rule that uses `TopCustomers` sees only its 10 rows, and so do its [assertions](../assertions.md).

`@Limit` combines with the `limit` argument of `compile()`: the effective limit is `min(limit, @Limit)`.

## `@Recursive`

Enables recursion on a predicate, with a maximum number of iterations:

```logica
@Recursive(AllManagers, 20);
```

It takes the predicate and the number of iterations, nothing else. The number of iterations is optional (8 by default), a whole number, 1 or more, or `-1`: until a step changes nothing. It bounds the recursion; Synalog stops earlier when the recursion converges. See [how recursion runs](recursion.md#how-recursion-runs).

## `@Ground`

Forces a predicate to be materialized before its dependents are evaluated, useful when a predicate is reused by many rules and recomputing it inline would be wasteful:

```logica
@Ground(CustomerRevenue);
```

The table is named after the predicate, in Synalog's schema (`CustomerRevenue`); a predicate named after an SQL keyword gets `_table` added (`Order_table`), since `Order` does not parse as a table name.

## `@Engine`

Selects the target SQL dialect for the whole program:

```logica
@Engine("duckdb");
```

The `engine` keyword of the [Python API](../python-api.md) functions overrides this annotation.

## `@Assert`

States a property of a predicate in first-order logic. Each property has a name, given as a named argument:

```logica
@Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");

@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
```

Unlike the other directives, it does not change the generated SQL, and it can be written before its predicate exists. Assertions are checked against a database with [`verify`](../cli.md). See [Assertions](../assertions.md).

## Complete example

`@OrderBy` and `@Limit` combined: the top 3 customers by total spend:

```logica
--8<-- "docs/examples/directives.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/directives.log"
    ```
