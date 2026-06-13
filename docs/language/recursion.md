# Recursion

Recursive predicates compute **transitive closures** — relationships that span an arbitrary number of hops. This is the kind of query that is impossible to write correctly in plain SQL without engine-specific recursive CTEs.

Typical uses: org charts, referral chains, product taxonomies, bill of materials, dependency graphs.

## Transitive closure

Define a **base case** and a **recursive case**, and put the [`@Recursive` directive](directives.md#recursive) before the rules with an iteration limit:

```logica
@Recursive(AllManagers, 20);

# Base case: direct manager
AllManagers(employee_id:, manager_id:) :- Employees(employee_id:, manager_id:);

# Recursive case: manager's managers
AllManagers(employee_id:, manager_id:) :-
  AllManagers(employee_id:, intermediate:),
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

The recursive closure of a parent/child edge detects cycles in a hierarchy — a node that is its own ancestor:

```logica
@Recursive(AncestorOf, 100);
AncestorOf(ancestor_id:, descendant_id:) :- ParentOf(parent_id: ancestor_id, child_id: descendant_id);
AncestorOf(ancestor_id:, descendant_id:) :-
  AncestorOf(ancestor_id:, intermediate:),
  ParentOf(parent_id: intermediate, child_id: descendant_id);

HierarchyCycle(node_id:) :- AncestorOf(ancestor_id: node_id, descendant_id: node_id);
```

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
