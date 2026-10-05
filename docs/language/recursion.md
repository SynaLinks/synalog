# Recursion

Recursive predicates compute **transitive closures**, relationships that span an arbitrary number of hops. This is the kind of query that is impossible to write correctly in plain SQL without engine-specific recursive CTEs.

Typical uses: org charts, referral chains, product taxonomies, bill of materials, dependency graphs.

## Transitive closure

Define a **base case** and a **recursive case**, and put the [`@Recursive` directive](directives.md#recursive) before the rules with an iteration limit:

```logica
@Recursive(AllManagers, 20);

# Base case: direct manager
AllManagers(employee_id:, manager_id:) :- Employees(employee_id:, manager_id:);

# Recursive case: manager's managers
AllManagers(employee_id:, manager_id:) :-
  AllManagers(employee_id:, manager_id: intermediate),
  Employees(employee_id: intermediate, manager_id:);
```

## Shortest paths

Find shortest paths in weighted graphs by enumerating route costs recursively, then keeping the minimum per destination with a `Min=` aggregation:

```logica
# Enumerate route costs from the origin, hop by hop.
@Recursive(RouteCost, 10);
RouteCost(destination:, cost:) :-
  ShippingRoutes(origin: "warehouse_main", destination:, cost:);
RouteCost(destination:, cost: total) :-
  RouteCost(destination: hub, cost: hub_cost),
  ShippingRoutes(origin: hub, destination:, cost:),
  total == hub_cost + cost;

# Keep the cheapest cost per destination.
@OrderBy(ShippingCost, "destination");
ShippingCost(destination:, total? Min= cost) distinct :- RouteCost(destination:, cost:);
```

The `@Recursive` iteration limit bounds the path length, so cyclic route graphs terminate; the final aggregation keeps only the cheapest route per destination.

## Cycle detection

The recursive closure of a parent/child edge detects cycles in a hierarchy: a node that is its own ancestor:

```logica
@Recursive(AncestorOf, 100);
AncestorOf(ancestor_id:, descendant_id:) :- ParentOf(parent_id: ancestor_id, child_id: descendant_id);
AncestorOf(ancestor_id:, descendant_id:) :-
  AncestorOf(ancestor_id:, descendant_id: intermediate),
  ParentOf(parent_id: intermediate, child_id: descendant_id);

HierarchyCycle(node_id:) :- AncestorOf(ancestor_id: node_id, descendant_id: node_id);
```

## How recursion runs

A step applies every rule of the recursion once, also when predicates recurse through each other: `@Recursive(Even, 5)` over `Even` and `Odd` gives what five rounds of their rules give, whatever the engine and the depth.

Up to 20 steps, a recursion is unrolled into a single query. Past 20 steps, or with `@Recursive(P, -1)`, it is computed into tables, step by step. On Presto, Databricks and Trino every recursion is computed into tables: the planners of Presto and Spark take time exponential in the number of unrolled steps (20 steps took minutes to plan on Presto, 12 on Spark), and Trino copies an unrolled recursion into every query that reads it, past its limit of stages when a query reads it several times. A table per step costs one short query each.

- **Until it converges.** When Synalog runs a predicate (`synalog ... run`, [`synalog.execute`](../python-api.md#execute)), it stops a recursion as soon as a step changes nothing. A recursion costs the steps its data needs: `@Recursive(AncestorOf, 100)` over a hierarchy 6 levels deep takes 6 steps, and `@Recursive(P, -1)` recurses until nothing changes, on every engine.
- **One step, the new rows.** A recursion of one `distinct` predicate, without aggregation, whose rules reference it at most once (the transitive closures above) is evaluated semi-naively: each step derives rows only from the rows the previous step added, so a step costs what changed, not the whole relation. Other recursions (an aggregate such as `Min=` in the recursion, mutual recursion, a rule joining the recursion with itself) recompute the relation at every step.
- **No tables left behind.** The tables a run computes in Synalog's own schemas (`logica_home`, `logica_test`) are dropped once its rows are read.
- **A script.** [`synalog.compile`](../python-api.md#compile) returns one SQL script, which cannot stop by itself: it writes every step out, up to the declared depth, and refuses a recursion too deep to write out. Run deep recursions with Synalog.

## Safety

The [verifier](../verification.md) checks recursive programs at compile time: missing base cases, trivial loops, and unbounded recursion without `@Recursive` are all reported as errors before any SQL is generated.

## Complete example

A management chain (transitive closure) and a shortest-path computation. The shortest path is written as a recursive `RouteCost` enumeration followed by a `Min=` aggregation per destination:

```logica
--8<-- "docs/examples/recursion.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/recursion.log"
    ```
