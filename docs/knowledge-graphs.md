# Knowledge graphs

When your data has entities and relationships, model it as a graph: entity concepts are the vertices, relationship concepts are the connections, and rules traverse the graph.

These are **modeling conventions**, not language rules — the compiler attaches no special meaning to a concept's name. They are the discipline that keeps a growing rule base composable, and the structure Synalog-based agent runtimes expect.

Nodes and edges are how the agent builds the knowledge-graph layer of its [dynamic semantic layer](index.md): once entities and relationships are named, every later rule traverses them instead of re-joining raw tables, and a filter on one node propagates through the whole graph.

## Conventions

- **Nodes are entities, edges are relationships, rules are traversals.**
- **Primary key first** — the first column of every concept is its primary key; sort by it with `@OrderBy`.
- **Preserve URIs and URLs** in nodes (`url`, `href`, `link`, `website`, `profile_url`, `image_url`, `permalink`, `homepage`, …). Dropping them makes the concept useless for downstream action.
- **Edges join through nodes**, not raw tables. This guarantees referential integrity: a filter on a node automatically applies to every edge that references it.

```logica
@OrderBy(Person, "person_id");
Person(person_id:, name:, role:) distinct :- Employees(person_id:, name:, role:);

@OrderBy(WorksIn, "person_id");
WorksIn(person_id:, department_id:) distinct :-
  Person(person_id:),
  Department(department_id:),
  Employees(person_id:, department_id:);
```

## Edge patterns

### N-ary relationships

When more than two entities participate, include all of them as columns:

```logica
WorksOn(person_id:, project_id:, role:) distinct :-
  Person(person_id:), Project(project_id:),
  ProjectAssignments(person_id:, project_id:, role:);
```

### Weighted edges

Attach a numeric attribute to the relationship — often an aggregate:

```logica
Purchased(customer_id:, product_id:, total_amount? += amount) distinct :-
  Customer(customer_id:), Product(product_id:),
  Orders(customer_id:, product_id:, amount:);
```

### Types and statuses as separate concepts

When an entity or relationship has distinct categorical states, model one concept per state — `ActiveUser`, `ChurnedUser`, `ActiveContract`, `TerminatedContract` — each joined through the base node.

### Symmetric edges

Define the raw direction once (e.g. with `a < b`), then close it with a union:

```logica
CoAuthored(author_a:, author_b:, paper_id:) distinct :-
  CoAuthoredRaw(author_a:, author_b:, paper_id:) |
  CoAuthoredRaw(author_a: author_b, author_b: author_a, paper_id:);
```

### Inverse edges

Derive the opposite direction from an existing edge:

```logica
ReportsTo(employee_id:, manager_id:) distinct :- Manages(manager_id:, employee_id:);
```

### Edge composition

Chain different edge types: `A→B` via one relation and `B→C` via another gives `A→C`:

```logica
WorksWithClient(employee_id:, client_id:) distinct :-
  MemberOf(employee_id:, team_id:),
  EngagedWith(team_id:, client_id:);
```

### Chains and paths

Recursion over a single edge type (parent→child, manager→employee) computes chains — see [Recursion](language/recursion.md). To track the route rather than just the endpoints, accumulate it with `List=` or string concatenation in the recursive rule.

### Cycle and cardinality checks

A recursive closure detects hierarchy cycles ([example](language/recursion.md#cycle-detection)). For cardinality constraints, count children per parent and filter for violations:

```logica
ChildCount(parent_id:, n? += 1) distinct :- ParentOf(parent_id:, child_id:);
TooManyChildren(parent_id:, n:) :- ChildCount(parent_id:, n:), n > 2;
```

### Temporal edges

Include `start_date`/`end_date` extracted via the [temporal pipeline](language/temporal.md), then filter with `Today` for "active today" queries or use the overlap test `s1 <= e2 && s2 <= e1`.

## Key principles

- Every edge joins through node concepts for referential integrity.
- Reuse aggressively — once nodes and edges exist, all rules build on them instead of going back to raw tables.
- The graph *is* the agent's memory: each new concept or rule extends what every later query can express.

## Complete example

A small employee/team/client graph: nodes with primary keys and preserved URLs, edges joined through nodes, an inverse edge, and an edge composition:

```logica
--8<-- "docs/examples/knowledge_graphs.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/knowledge_graphs.log"
    ```

To turn an existing **OWL/RDF ontology** into a knowledge graph like this automatically, see [Ontologies](ontologies.md).
