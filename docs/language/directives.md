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
| `@Spec(Pred, name: "statement")` | State a property the predicate must satisfy. See [Specs and proofs](../verification.md#specs-and-proofs). |
| `@Proof(Pred, name: "proof")` | Prove the property a `@Spec` states under the same name. |

## `@OrderBy`

```logica
@OrderBy(Stats, "category");
@OrderBy(TopCustomers, "total", "DESC");
```

!!! warning "`@OrderBy` is mandatory in practice"
    Put `@OrderBy` on **every concept and rule**. Without a stable sort order, pagination (`limit`/`offset` in [`compile()`](../python-api.md#compile)) returns rows in a non-deterministic order between calls.

## `@Limit`

```logica
@Limit(TopCustomers, 10);
```

`@Limit` combines with the `limit` argument of `compile()`: the effective limit is `min(limit, @Limit)`.

## `@Recursive`

Enables recursion on a predicate, with a maximum number of iterations:

```logica
@Recursive(AllManagers, 20);
```

The full signature is `@Recursive(Pred, iterations, stop?, satellites?)`. See [Recursion](recursion.md) for usage.

## `@Ground`

Forces a predicate to be materialized before its dependents are evaluated, useful when a predicate is reused by many rules and recomputing it inline would be wasteful:

```logica
@Ground(CustomerRevenue);
```

## `@Engine`

Selects the target SQL dialect for the whole program:

```logica
@Engine("duckdb");
```

The `engine` keyword of the [Python API](../python-api.md) functions overrides this annotation.

## `@Spec` and `@Proof`

`@Spec` states a property of a predicate, `@Proof` justifies it. Each property has a name, given as a named argument, and a `@Proof` refers to the spec of the same predicate with the same name:

```logica
@Spec(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z");

@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), parent(x: y, y: z);

@Proof(Ancestor, transitive: "intro x y z h1 h2; induction h2 <;> aesop");
```

Unlike the other directives, they do not change the generated SQL. A spec can be written before its predicate exists. See [Specs and proofs](../verification.md#specs-and-proofs).

## Complete example

`@OrderBy` and `@Limit` combined: the top 3 customers by total spend:

```logica
--8<-- "docs/examples/directives.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/directives.log"
    ```
