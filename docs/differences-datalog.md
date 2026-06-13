# Differences with Datalog

Synalog belongs to the [Datalog](https://en.wikipedia.org/wiki/Datalog) family: programs are facts and rules, rules compose and recurse, and negation is stratified. If you know Datalog, you already know how to read a Synalog program. But Synalog targets SQL engines and AI agents rather than a resident logic engine, and that changes the language in deliberate ways.

| | Classical Datalog | Synalog |
|---|---|---|
| Arguments | Positional: `edge(X, Y)` | Named: `Edge(from:, to:)` |
| Evaluation | Bottom-up fixpoint engine | Compiled to SQL, run by the database |
| Facts (EDB) | Asserted in the program | Database tables (inline facts also work) |
| Semantics | Sets | Multisets — `distinct` opts into set semantics |
| Terms | Constants and variables only | Full expressions: arithmetic, strings, records, arrays |
| Aggregation | Not in the core language | First-class, in the rule head |
| Recursion | Least fixpoint, always terminates | Bounded by an explicit `@Recursive` iteration limit |
| Result order | Unordered | `@OrderBy` / `@Limit`, deterministic pagination |
| Safety checks | Engine-dependent | Compile-time [verifier](verification.md) |

## Named arguments, not positional

Datalog identifies arguments by position — `edge(X, Y)` means whatever the first and second columns happen to be. Synalog uses [named arguments](language/syntax.md#named-arguments) exclusively:

```logica
# Datalog — positional, not supported
# edge(X, Y) :- node(X), node(Y), link(X, Y).

# Synalog — every argument is named
Edge(from:, to:) :- Node(node_id: from), Node(node_id: to), Links(from:, to:);
```

Positions can't be silently swapped, predicates read like schemas, and the compiled SQL uses real column names.

## Evaluation: compiled to SQL, not a fixpoint engine

A classical Datalog system loads facts into its own engine and computes the least fixpoint bottom-up (semi-naive evaluation). Synalog has no resident engine: [`compile()`](python-api.md#compile) translates the program to SQL and the database evaluates it. The extensional database is your existing tables — declared read-only in the [`# Tables` section](language/index.md#tables) — so facts never have to be exported, loaded or kept in sync.

The trade is deliberate: you give up an incremental in-memory engine and gain the optimizers, indexes and scale of **SQLite**, **DuckDB**, **BigQuery**, **PostgreSQL**, **Presto**, **Trino** and **Databricks**. See [Supported engines](engines.md).

## Multiset semantics by default

A Datalog relation is a *set* — duplicates cannot exist. Synalog inherits SQL's *multiset* semantics: a rule body that matches a row twice produces it twice, and the union operator `|` is a `UNION ALL`. Deduplication is opt-in with the `distinct` keyword:

```logica
# Set semantics, as in Datalog — duplicates removed
CustomerNode(customer_id:) distinct :- Orders(customer_id:);
```

This is why the documentation marks concepts and aggregating rules `distinct` throughout: it restores the Datalog behavior where you want it, without paying for it where you don't.

## Expressions where Datalog allows only terms

Pure Datalog restricts terms to constants and variables — no function symbols — which is exactly what guarantees its termination. Synalog drops that restriction: rule bodies can compute with [arithmetic, string and comparison operators](language/syntax.md#operators), [conditionals](language/syntax.md#conditionals), [records](language/syntax.md#records), arrays, [built-in functions](language/functions.md) and [user-defined functions](language/functions.md#user-defined-functions):

```logica
OrderSize(order_id:, size:) :-
  Orders(order_id:, amount:),
  size == (if amount > 1000 then "large" else "small");
```

## Aggregation in the rule head

Core Datalog has no aggregation; systems that add it bolt it on with varying syntax and semantics. In Synalog [aggregation](language/aggregation.md) is part of the rule head — `+=`, `Min=`, `Max=`, `Avg=`, `List=`, `Set=`, `ArgMax=` and more:

```logica
@OrderBy(CustomerSpend, "total", "DESC");
CustomerSpend(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);
```

The non-aggregated head columns act as the grouping key, like SQL's `GROUP BY`.

## Bounded recursion instead of a least fixpoint

Datalog recursion always terminates because the Herbrand universe is finite — no function symbols means no new values can ever be created. Synalog's expressions break that guarantee (a recursive rule can compute `cost + hop` forever), so [recursion](language/recursion.md) requires an explicit iteration bound via the [`@Recursive` directive](language/directives.md#recursive):

```logica
@Recursive(AllManagers, 20);
AllManagers(employee_id:, manager_id:) :- Employees(employee_id:, manager_id:);
AllManagers(employee_id:, manager_id:) :-
  AllManagers(employee_id:, intermediate:),
  Employees(employee_id: intermediate, manager_id:);
```

The limit bounds the number of hops, so even cyclic graphs terminate. For a closure that has converged, extra iterations add nothing — the bound just needs to exceed the longest chain. The [verifier](verification.md) rejects recursive predicates that lack a base case or an `@Recursive` bound.

## Results are ordered and pageable

Datalog answers are unordered sets — there is no notion of "the first ten results". Synalog adds [`@OrderBy` and `@Limit`](language/directives.md) so results are deterministic and pageable, which is what lets an agent with a limited context window walk a large result set page by page:

```logica
@OrderBy(TopCustomers, "total DESC");
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, total:) :- CustomerSpend(customer_id:, total:);
```

This is also why `@OrderBy` is mandatory on every concept and rule: without it, pagination order is left to the SQL engine and becomes non-deterministic.

## Functors: parameterized predicates

Datalog predicates are first-order — a rule cannot take another predicate as a parameter. Synalog's [functors](language/functors.md) allow exactly that, instantiating a generic rule with different predicates:

```logica
EnterpriseRevenue := SegmentRevenue(Segment: EnterpriseCustomer);
SMBRevenue        := SegmentRevenue(Segment: SMBCustomer);
```

This is resolved at compile time — the result is still ordinary SQL — but it gives the reuse that first-order Datalog can't express.

## Safety enforced at compile time

The classic Datalog safety conditions — range restriction (every head variable bound in the body), safe negation, stratification — are usually enforced by the evaluation engine, if at all. Synalog enforces them in a compile-time [verifier](verification.md), together with checks Datalog never needed (arity consistency, recursion bounds). Errors are reported before any SQL is generated, with messages written to be fed back to an agent.

## What stays the same

The core model is unchanged from Datalog: rules with a head and a body, conjunction by `,`, disjunction by `|` or multiple rule definitions, negation by `~` (stratified), and recursion by self-reference. A Synalog program is still a set of composable logical rules — that composability is the whole point. See [Program structure](language/index.md).
