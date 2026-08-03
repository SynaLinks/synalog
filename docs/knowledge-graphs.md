# Knowledge graphs

When your data has entities and relationships, model it as a graph: entity concepts are the vertices, relationship concepts are the connections, and rules traverse the graph.

These are **modeling conventions**, not language rules. The compiler attaches no special meaning to a concept's name. They are the discipline that keeps a growing rule base composable, and the structure Synalog-based agent runtimes expect.

Nodes and edges are how the agent builds the knowledge-graph layer of its [dynamic semantic layer](index.md): once entities and relationships are named, every later rule traverses them instead of re-joining raw tables, and a filter on one node propagates through the whole graph.

The graph is **virtual**. Nothing is copied into a graph database: nodes and edges are ordinary predicates that compile to SQL over the source tables, so the graph is always as fresh as the data underneath it.

## Why model a graph at all

The questions a business actually asks are rarely about a table. They are about how things connect:

- Which customers are exposed to this supplier, directly or through a subcontractor?
- Who can approve this request, and who approves them if they are away?
- Which accounts share a phone number with an account we just flagged?
- Which teams touched this client, and were they on the team at the time?
- If we discontinue this component, which finished products break?

Each of those is a *traversal*. Written directly in SQL, each becomes a bespoke chain of joins: correct only if whoever wrote it remembered every filter, and rewritten from scratch for the next question. The join logic is the knowledge, and it ends up scattered across hundreds of queries where it can neither be reviewed nor reused.

Modeling entities and relationships as concepts moves that knowledge into one place. `Person`, `Team`, `Client`, `MemberOf`, `EngagedWith` are written once. After that, "which teams touched this client" is two lines, and so is every variant of it nobody has thought of yet.

### What it buys

- **Questions get short.** The expensive part (deciding how things connect) is done once, not per query. New questions compose existing edges instead of re-deriving joins.
- **Filters propagate.** Because edges join through nodes, narrowing `Person` to active employees narrows every traversal, metric and report built on it, without editing a single downstream rule. This is the property that makes a graph model worth the effort.
- **Relationships become reviewable.** "How do we decide a person works in a department?" is a named rule someone can read, not a `JOIN` buried in query 47.
- **Recursive questions become expressible.** Org charts, bills of materials, referral chains and dependency closures are [a base case plus a recursive case](language/recursion.md) rather than something you give up on in SQL.
- **No new system.** The graph is a way of *reading* the tables you already have. Nothing is exported, synchronized or operated.

### What it costs

- **It is modeling work.** Someone has to decide what the entities are and what identifies them. It is hours, not months, and an agent can propose a first draft, but it is not free.
- **Discipline is required to keep the payoff.** The moment a rule goes back to the raw table instead of the node, referential integrity and filter propagation are lost for that rule and everything above it.
- **Identity is the hard part.** When the same customer exists in three systems with three keys, the graph forces you to decide how they reconcile. That decision was always required; the graph just refuses to let it stay implicit.
- **Deep traversal is still database work.** Each recursive hop is another join. Bounded closures over a mid-sized graph are fine; interactive pathfinding over billions of edges is not what this is for.
- **Hubs get recomputed.** A node concept used by twenty rules is inlined into each of them unless you materialize it with [`@Ground`](language/directives.md#ground).

### Compared to a dedicated graph database

| | Virtual graph in Synalog | Graph database |
|---|---|---|
| Where the data lives | Your existing tables, untouched | A separate store, loaded and kept in sync |
| Freshness | Always current by construction | As fresh as the last sync |
| Operational cost | None beyond the warehouse | A second system to run, secure and back up |
| Deep or unbounded traversal | Bounded hops, each one a join | What the engine is built for |
| Graph algorithms (centrality, communities) | Out of scope | First-class |
| Aggregation and analytics across the graph | Warehouse-grade | Usually a weak point |
| Combining graph and non-graph data | Same query, same engine | Requires federation or export |

Choose a graph database when traversal depth is unpredictable, latency budgets are interactive, or you need real graph algorithms. Choose the virtual graph when the data already lives in a warehouse, freshness matters, traversals are shallow and bounded, and you would rather not run another database. Many teams end up with both: the warehouse graph for analysis and reasoning, a specialized store for the one workload that genuinely needs it.

### When not to model a graph

If the data is one wide table with no meaningful relationships, or the questions are pure aggregations over a single fact table, the graph conventions add ceremony and buy nothing. Model nodes when something is referenced from more than one place, or when the answer to a question depends on following a connection.

## Conventions

- **Nodes are entities, edges are relationships, rules are traversals.**
- **Primary key first.** The first column of every concept is its primary key; sort by it with `@OrderBy`.
- **Preserve URIs and URLs** in nodes (`url`, `href`, `link`, `website`, `profile_url`, `image_url`, `permalink`, `homepage`, and so on). Dropping them makes the concept useless for downstream action.
- **Edges join through nodes**, not raw tables. This guarantees referential integrity: a filter on a node automatically applies to every edge that references it.
- **Name plainly.** `Person`, `Team`, `WorksIn`, `ReportsTo`. No `Node`, `Edge` or `Rel` suffixes.

```logica
@OrderBy(Person, "person_id");
Person(person_id:, name:, role:) distinct :- Employees(person_id:, name:, role:);

@OrderBy(WorksIn, "person_id");
WorksIn(person_id:, department_id:) distinct :-
  Person(person_id:),
  Department(department_id:),
  Employees(person_id:, department_id:);
```

`WorksIn` mentions `Person` and `Department` even though `Employees` already carries both columns. That join is the point: it is what makes the edge follow the nodes. Restrict `Person` to active employees and every edge, traversal and metric built on it narrows with it, without touching a single rule downstream.

## Node patterns

### Entities from tables

A node concept is a `distinct` projection of the identifying and descriptive columns of a table:

```logica
@OrderBy(Product, "product_id");
Product(product_id:, name:, category:, permalink:) distinct :-
  Products(product_id:, name:, category:, permalink:);
```

### Categorical values as nodes

Columns such as `status`, `tier`, `category` or `country` are entities in disguise. Extract the distinct values as a node *before* writing rules over them, so the vocabulary is discoverable and every rule agrees on it:

```logica
@OrderBy(Category, "category");
Category(category:) distinct :- Products(category:);

@OrderBy(BelongsTo, "product_id");
BelongsTo(product_id:, category:) distinct :-
  Product(product_id:), Category(category:), Products(product_id:, category:);
```

### Subtypes and states

When an entity has distinct categorical states, model one concept per state, each joined through the base node. The subtype is then a drop-in replacement for the base node in any rule:

```logica
@OrderBy(ActiveCustomer, "customer_id");
ActiveCustomer(customer_id:, name:) distinct :-
  Customer(customer_id:, name:, status: "active");

@OrderBy(ChurnedCustomer, "customer_id");
ChurnedCustomer(customer_id:, name:) distinct :-
  Customer(customer_id:, name:, status: "churned");
```

Combined with [functors](language/functors.md), a subtype becomes a parameter: the same traversal runs over `ActiveCustomer` or `ChurnedCustomer` without being rewritten.

### One node type, several sources

Entities often arrive from more than one table. Union the sources into a single node concept and make the identifier globally unique, so edges from either side land on the same vertex:

```logica
@OrderBy(Party, "party_id");
Party(party_id:, name:, kind:) distinct :-
  Employees(employee_id:, name:),
    party_id == "employee:" ++ ToString(employee_id), kind == "employee" |
  Contractors(contractor_id:, name:),
    party_id == "contractor:" ++ ToString(contractor_id), kind == "contractor";
```

Prefixing the source keeps two systems that both number their rows from 1 from colliding on the same node.

## Edge patterns

### N-ary relationships

When more than two entities participate, include all of them as columns:

```logica
WorksOn(person_id:, project_id:, role:) distinct :-
  Person(person_id:), Project(project_id:),
  ProjectAssignments(person_id:, project_id:, role:);
```

### Weighted edges

Attach a numeric attribute to the relationship, often an aggregate:

```logica
Purchased(customer_id:, product_id:, total_amount? += amount) distinct :-
  Customer(customer_id:), Product(product_id:),
  Orders(customer_id:, product_id:, amount:);
```

### Typed edges

Two options, and the choice matters. One concept per relationship type (`Manages`, `Mentors`) keeps rules precise and lets the verifier catch mistakes. A single concept with a `type` column is useful when a rule has to walk *any* connection, for example to compute a neighborhood or a degree:

```logica
@OrderBy(Related, "source_id", "target_id");
Related(source_id:, target_id:, type:) distinct :-
  Manages(manager_id: source_id, employee_id: target_id), type == "manages" |
  Mentors(mentor_id: source_id, mentee_id: target_id), type == "mentors";
```

Define the typed relations first and derive `Related` from them, never the other way around.

### Symmetric edges

Define the raw direction once, for example with `a < b`, then close it with a union:

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

### Reified edges

When a relationship has attributes of its own, or when other things point *at* the relationship, promote it to a node and connect it with two edges. An assignment with a role, an allocation and its own history is an entity, not a label on a line:

```logica
## The relationship as a node.
@OrderBy(Assignment, "assignment_id");
Assignment(assignment_id:, role:, allocation:) distinct :-
  ProjectAssignments(assignment_id:, role:, allocation:);

@OrderBy(AssignmentPerson, "assignment_id");
AssignmentPerson(assignment_id:, person_id:) distinct :-
  Assignment(assignment_id:), Person(person_id:),
  ProjectAssignments(assignment_id:, person_id:);

@OrderBy(AssignmentProject, "assignment_id");
AssignmentProject(assignment_id:, project_id:) distinct :-
  Assignment(assignment_id:), Project(project_id:),
  ProjectAssignments(assignment_id:, project_id:);
```

The plain `person -> project` edge is then one composition away, and stays available for callers that do not care about the details.

### Edge composition

Chain different edge types: `A -> B` via one relation and `B -> C` via another gives `A -> C`:

```logica
WorksWithClient(employee_id:, client_id:) distinct :-
  MemberOf(employee_id:, team_id:),
  EngagedWith(team_id:, client_id:);
```

### Chains and paths

Recursion over a single edge type (parent to child, manager to employee) computes chains. See [Recursion](language/recursion.md). To track the route rather than just the endpoints, accumulate it in the recursive rule:

```logica
@Recursive(PathTo, 10);
@OrderBy(PathTo, "source", "target");
PathTo(source:, target:, path:) distinct :-
  Edge(source:, target:),
  path == source ++ " > " ++ target;
PathTo(source:, target:, path:) distinct :-
  PathTo(source:, target: mid, path: prefix),
  Edge(source: mid, target:),
  path == prefix ++ " > " ++ target;
```

`List=` collects the visited nodes as an array instead, when the route is consumed by a program rather than read by a human.

### Cycle and cardinality checks

A recursive closure detects hierarchy cycles ([example](language/recursion.md#cycle-detection)). For cardinality constraints, count children per parent and filter for violations:

```logica
ChildCount(parent_id:, n? += 1) distinct :- ParentOf(parent_id:, child_id:);
TooManyChildren(parent_id:, n:) :- ChildCount(parent_id:, n:), n > 2;
```

Dangling references are the mirror image, and negation finds them:

```logica
OrphanEdge(child_id:) :- ParentOf(child_id:), ~Person(person_id: child_id);
```

## Traversals

Once nodes and edges exist, questions become short rules over them.

**Neighborhood.** Everything one hop away from a node, in either direction:

```logica
@OrderBy(Neighbor, "node_id", "neighbor_id");
Neighbor(node_id:, neighbor_id:, type:) distinct :-
  Related(source_id: node_id, target_id: neighbor_id, type:) |
  Related(source_id: neighbor_id, target_id: node_id, type:);
```

**Degree.** How connected a node is, straight from an aggregation:

```logica
@OrderBy(Degree, "n", "DESC");
Degree(node_id:, n? += 1) distinct :- Neighbor(node_id:);
```

**Multi-hop.** Bounded transitive closure with [`@Recursive`](language/directives.md#recursive), and shortest paths with a `Min=` aggregation over enumerated route costs. Both are covered in [Recursion](language/recursion.md).

**Restriction.** Because edges join through nodes, narrowing the graph is a node-level change. Swap `Person` for `ActiveCustomer` with a [functor](language/functors.md) and the entire traversal runs on the sub-graph.

!!! tip "Materialize the hubs"
    A node or edge concept that many rules build on is recomputed inline in each of them. Put [`@Ground`](language/directives.md#ground) on it to materialize it once before its dependents run.

### Complete example

A small employee, team and client graph: nodes with primary keys and preserved URLs, edges joined through nodes, an inverse edge, and an edge composition:

```logica
--8<-- "docs/examples/knowledge_graphs.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/knowledge_graphs.log"
    ```

## Choosing a time model

Before adding date columns to anything, decide what kind of time question the relation actually has to answer. Three questions settle it:

1. Does anyone ever ask what this looked like at an earlier date?
2. Does this data ever get **corrected** after the fact, backdated, or restated?
3. Does anyone ever have to reproduce an answer *as it was given*, not as it is now understood?

| Model | Extra columns | Answers | Cost | Typical use |
|---|---|---|---|---|
| **Snapshot** (no time) | none | What is true now | None | Reference data, categories, anything that only ever gains rows |
| **Valid time** | `valid_from`, `valid_to` | What was true on a given date | Interval maintenance, overlap logic in joins | Employments, contracts, assignments, prices, subscriptions |
| **Transaction time** | `recorded_from`, `recorded_to` | What the database held on a given date | Append-only writes, versions accumulate | Audit trails, agent memory, anything a regulator may inspect |
| **Bitemporal** | all four | Both, independently | Both of the above, plus care in every query | Late-arriving or corrected data with reporting obligations |

Answer "no" to all three and use a snapshot; the cheapest correct model is a real design win, not a shortcut. Answer "yes" only to the first and valid time is enough. Reach for bitemporality when the second and third are also yes.

This is a decision **per relation**, not per graph. A graph where employments are bitemporal, team memberships carry valid time and job titles are a plain snapshot is normal and correct. Mixed models compose: a uni-temporal edge joins with a bitemporal one as long as the missing axis is treated as always valid.

!!! tip "Start smaller than you think"
    Time columns are easy to add to a relation later and hard to remove once rules depend on them. Model the handful of relations where history is genuinely consequential, and leave the rest as snapshots until a real question forces the change.

## Temporal graphs

Most real relationships have a lifetime. An employment starts and ends, a contract is signed and expires, a device is assigned to a site for a while. A **temporal edge** carries that lifetime as columns, so a traversal can ask what the graph looked like at a given moment instead of only what it looks like today.

Two conventions make the arithmetic disappear:

- **Half-open intervals** `[valid_from, valid_to)`. The end of one period is the start of the next, with no gaps, no overlaps and no need to subtract a day anywhere.
- **A sentinel for the open end**, `"9999-12-31"`. ISO date strings compare correctly as strings, so "still true" needs no null handling and no special case in a filter.

Dates come out of the [temporal pipeline](language/temporal.md), never out of raw timestamp arithmetic:

```logica
@OrderBy(MemberOf, "person_id", "valid_from");
MemberOf(person_id:, team_id:, valid_from:, valid_to:) distinct :-
  Person(person_id:), Team(team_id:),
  TeamAssignments(person_id:, team_id:, started_at:, ended_at:),
  valid_from == Substr(ToString(started_at), 1, 10),
  valid_to   == Substr(ToString(ended_at), 1, 10);
```

### Closing intervals from an event log

Source systems often record only *changes*: one row per assignment, with no end date. The end of a period is the start of the next one for the same entity. Compute it with a self-join and a `Min=` aggregation, then handle the still-open period with negation:

```logica
## The next change for this person, when there is one.
@OrderBy(NextChange, "person_id", "changed_at");
NextChange(person_id:, changed_at:, next? Min= later) distinct :-
  Assignments(person_id:, changed_at:),
  Assignments(person_id:, changed_at: later),
  later > changed_at;

@OrderBy(MemberOf, "person_id", "valid_from");
MemberOf(person_id:, team_id:, valid_from:, valid_to:) distinct :-
  Person(person_id:), Team(team_id:),
  Assignments(person_id:, team_id:, changed_at: valid_from),
  NextChange(person_id:, changed_at: valid_from, next: valid_to);
MemberOf(person_id:, team_id:, valid_from:, valid_to:) distinct :-
  Person(person_id:), Team(team_id:),
  Assignments(person_id:, team_id:, changed_at: valid_from),
  ~NextChange(person_id:, changed_at: valid_from),
  valid_to == "9999-12-31";
```

### Edges valid now

`Today` supplies the clock, and the half-open test reads exactly like the interval:

```logica
@OrderBy(ActiveMember, "person_id");
ActiveMember(person_id:, name:, team_id:) distinct :-
  MemberOf(person_id:, team_id:, valid_from:, valid_to:),
  Person(person_id:, name:),
  Today(date:),
  valid_from <= date, date < valid_to;
```

### Overlap between edges

Two periods `[s1, e1)` and `[s2, e2)` overlap when `s1 < e2 && s2 < e1`. A derived edge should carry the **intersection** of the periods it was built from, and exist only when that intersection is non-empty:

```logica
@OrderBy(Colleague, "person_a", "person_b");
Colleague(person_a:, person_b:, team_id:, valid_from:, valid_to:) distinct :-
  MemberOf(person_id: person_a, team_id:, valid_from: a_from, valid_to: a_to),
  MemberOf(person_id: person_b, team_id:, valid_from: b_from, valid_to: b_to),
  person_a < person_b,
  valid_from == (if a_from > b_from then a_from else b_from),
  valid_to   == (if a_to < b_to then a_to else b_to),
  valid_from < valid_to;
```

Two people on the same team five years apart are not colleagues, and the rule says so without a single date function.

### Time-respecting traversal

The same intersection carried through a recursive rule gives paths whose hops are *simultaneously* valid. A path that would need a hop to travel back in time is never derived:

```logica
@Recursive(ReachedBy, 10);
@OrderBy(ReachedBy, "source", "target");
ReachedBy(source:, target:, valid_from:, valid_to:) distinct :-
  HandedOver(source:, target:, valid_from:, valid_to:);
ReachedBy(source:, target:, valid_from:, valid_to:) distinct :-
  ReachedBy(source:, target: mid, valid_from: p_from, valid_to: p_to),
  HandedOver(source: mid, target:, valid_from: h_from, valid_to: h_to),
  valid_from == (if p_from > h_from then p_from else h_from),
  valid_to   == (if p_to < h_to then p_to else h_to),
  valid_from < valid_to;
```

### Complete example

Interval closing from an event log, "active today", the overlap join and the time-respecting closure, in one runnable program:

```logica
--8<-- "docs/examples/temporal_graph.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/temporal_graph.log"
    ```

## Bitemporal graphs

A temporal edge answers *when was this true*. It cannot answer *when did we believe it*, and those are different questions. A salary correction backdated to January, a contract entered a week late, a source system that restates yesterday's export: in all three cases the world did not change, our knowledge of it did.

A **bitemporal** graph tracks both axes.

| Axis | Columns | Question it answers |
|------|---------|---------------------|
| **Valid time** (world time) | `valid_from`, `valid_to` | When was the fact true in the world? |
| **Transaction time** (system time) | `recorded_from`, `recorded_to` | When did the database hold it to be true? |

Valid time is decided by the business and can be edited freely, including into the past and the future. Transaction time is decided by the clock and is **append-only**: a version is never modified, only superseded. That is what makes the graph auditable, and what lets an agent reproduce an answer it gave last month instead of quietly overwriting it.

!!! tip "Why an agent wants both"
    An agent that writes to its own semantic layer is a source of restatements. Transaction time keeps every belief it ever held, so a wrong conclusion can be traced, explained and reversed rather than lost. Valid time keeps the corrected history clean, so today's answer is right even when the data arrived late.

### Where the two clocks pay for themselves

The distinction sounds academic until it is someone's job. In each of these cases, a single time axis loses information the business is required to keep:

- **Restated reporting.** A quarter is published, then a correction lands. Finance now needs two numbers that are both right: what the corrected books say, and what was published at the time. With valid time alone, publishing the correction destroys the ability to reproduce the original filing.
- **Backdated changes.** A raise effective 1 January, approved in March. Payroll owes back pay (a valid-time fact) and the March payroll run was still correct given what was known then (a transaction-time fact). Overwriting the row makes the earlier run look like an error.
- **Late-arriving data.** A policy is bound on the 3rd and reaches the warehouse on the 11th. Every report between those dates was right on the evidence available. Without transaction time there is no way to demonstrate that, and the gap looks like a data quality failure.
- **Disputes and approvals.** "Was this within limits when it was approved?" is a question about what was known at approval time, not about the corrected record. Credit decisions, underwriting and access reviews all live here.
- **Regulatory reproducibility.** Several regimes require that a figure be reproducible as reported. That is a transaction-time requirement, and it cannot be bolted on after the fact: the versions have to have been kept.
- **Agent trust.** When an agent gives an answer that later turns out to be wrong, the useful question is whether it reasoned badly or was working from data that has since been corrected. Only transaction time can tell the two apart, and the difference decides whether you fix the rule or the source.

The common thread: **a correction is not an edit.** Treating it as one destroys evidence that someone eventually asks for, usually under time pressure and usually in front of an auditor.

### Modeling

One row per **version** of a fact, four interval columns, half-open on both axes, with `"9999-12-31"` as the open end:

```logica
@OrderBy(EmployedAt, "person_id", "recorded_from");
EmployedAt(person_id:, company_id:, role:,
           valid_from:, valid_to:, recorded_from:, recorded_to:) distinct :-
  Person(person_id:),
  Company(company_id:),
  EmploymentVersions(person_id:, company_id:, role:,
                     valid_from:, valid_to:, recorded_from:, recorded_to:);
```

The edge still joins through `Person` and `Company`. Versioning is a property of the relationship, not a reason to abandon the graph conventions.

A correction to Ada's role is two rows: the old version keeps its valid time but has its `recorded_to` closed, and a new version opens with the corrected value.

| role | valid_from | valid_to | recorded_from | recorded_to |
|------|------------|----------|---------------|-------------|
| engineer | 2024-01-01 | 9999-12-31 | 2024-01-05 | 2026-04-01 |
| lead | 2024-01-01 | 9999-12-31 | 2026-04-01 | 9999-12-31 |

Both rows say the fact was true from January 2024. They disagree about *what* the fact is, and the transaction interval says which answer was in force when.

### The current view

Believed now, true now. This is the view most rules should build on:

```logica
@OrderBy(CurrentEmployment, "person_id");
CurrentEmployment(person_id:, company_id:, role:) distinct :-
  EmployedAt(person_id:, company_id:, role:,
             valid_from:, valid_to:, recorded_to: "9999-12-31"),
  Today(date:),
  valid_from <= date, date < valid_to;
```

Matching `recorded_to: "9999-12-31"` directly in the argument list is the whole "latest version" filter. No window function, no ranking, no correlated subquery.

### As-of queries

Make the vantage point a predicate instead of a constant, and every point on the bitemporal plane becomes reachable by [functor](language/functors.md) application. The default is "now, as we know it now":

```logica
AsOf(valid_date:, known_date:) :-
  Today(date:), valid_date == date, known_date == date;

@OrderBy(EmploymentSnapshot, "person_id");
EmploymentSnapshot(person_id:, company_id:, role:) distinct :-
  AsOf(valid_date:, known_date:),
  EmployedAt(person_id:, company_id:, role:,
             valid_from:, valid_to:, recorded_from:, recorded_to:),
  valid_from <= valid_date, valid_date < valid_to,
  recorded_from <= known_date, known_date < recorded_to;

## What the database said in March 2026 about March 2026.
March2026(valid_date: "2026-03-01", known_date: "2026-03-01");
EmploymentAsKnownInMarch := EmploymentSnapshot(AsOf: March2026);
```

Three vantage points, one rule:

- `valid_date` moves, `known_date` stays at today: the corrected history, as we understand it now.
- `known_date` moves, `valid_date` stays at today: what we would have answered back then.
- Both move: a faithful replay of a past answer about a past moment, which is what an audit asks for.

Every rule layered on `EmploymentSnapshot` inherits the vantage point, so a whole analysis can be rewound by swapping one predicate.

### Corrections and retractions

The audit trail falls out of the versions themselves. A closed transaction interval with a successor is a **correction**:

```logica
@OrderBy(Correction, "person_id", "corrected_at");
Correction(person_id:, old_role:, new_role:, corrected_at:) distinct :-
  EmployedAt(person_id:, role: old_role, recorded_to: corrected_at),
  corrected_at != "9999-12-31",
  EmployedAt(person_id:, role: new_role, recorded_from: corrected_at);
```

A closed transaction interval with no successor is a **retraction**, an edge we no longer believe ever existed:

```logica
@OrderBy(Retracted, "person_id");
Retracted(person_id:, role:, retracted_at:) distinct :-
  EmployedAt(person_id:, role:, recorded_to: retracted_at),
  retracted_at != "9999-12-31",
  ~EmployedAt(person_id:, recorded_from: retracted_at);
```

Note what a retraction is *not*: it is not `valid_to` moving to today. Ending an employment is a fact about the world and belongs to valid time. Deciding the employment never happened is a fact about our knowledge and belongs to transaction time. Keeping the two apart is the entire benefit of the model.

### Joining bitemporal edges

A composition of two bitemporal edges is valid only where both are valid *and* both were believed. Intersect on both axes and keep the result only if both intervals are non-empty:

```logica
@OrderBy(WorkedWithClient, "person_id", "valid_from");
WorkedWithClient(person_id:, client_id:, valid_from:, valid_to:,
                 recorded_from:, recorded_to:) distinct :-
  MemberOf(person_id:, team_id:, valid_from: m_vf, valid_to: m_vt,
           recorded_from: m_rf, recorded_to: m_rt),
  EngagedWith(team_id:, client_id:, valid_from: e_vf, valid_to: e_vt,
              recorded_from: e_rf, recorded_to: e_rt),
  valid_from    == (if m_vf > e_vf then m_vf else e_vf),
  valid_to      == (if m_vt < e_vt then m_vt else e_vt),
  recorded_from == (if m_rf > e_rf then m_rf else e_rf),
  recorded_to   == (if m_rt < e_rt then m_rt else e_rt),
  valid_from < valid_to,
  recorded_from < recorded_to;
```

The derived edge is itself bitemporal, so it composes further and can be queried through the same `AsOf` vantage point.

### Filling the axes from real sources

Few tables arrive with four interval columns. The usual shapes:

- **Slowly changing dimension, type 2.** `effective_from` / `effective_to` are valid time. If the warehouse also keeps a load timestamp, that is transaction time; close its intervals with the [event-log technique](#closing-intervals-from-an-event-log) over `recorded_from`.
- **Change data capture.** One row per change with a commit timestamp and no end: that timestamp is `recorded_from`, and the next change for the same key closes it. Valid time comes from the business columns, or equals transaction time when the source has no notion of it.
- **Append-only event log.** Events carry only transaction time. Derive valid time from the event's own fields (`effective_date`, `signed_on`) when they exist, and be explicit when they do not: a fact that is only known, never dated, has valid time equal to transaction time.

When only one axis exists in the source, model that one honestly rather than inventing the other. A uni-temporal edge composes with bitemporal ones as long as the missing axis is treated as always valid.

### What bitemporality costs

Bitemporality is the most expensive modeling choice in this document, and it should be made deliberately:

- **Writes become append-only.** Nothing is ever updated in place: a change is a closed version plus a new one. Any process that writes to the relation has to be taught this, and a single `UPDATE` that slips through silently destroys the audit trail the model exists to provide.
- **Rows multiply.** A relation with frequent corrections grows with every restatement. Usually cheap relative to fact tables, occasionally not.
- **Every query must state a vantage point.** Forgetting the `recorded_to` filter returns every version of every fact and inflates counts, quietly. The mitigation is structural: build a [current view](#the-current-view) and an [`AsOf` predicate](#as-of-queries) early, and have ordinary rules go through them rather than touching the versioned edge directly.
- **The sources often do not cooperate.** Many systems overwrite in place and simply do not record when they learned something. You cannot reconstruct transaction time retroactively; you can only start capturing it from today. That argues for deciding early on the few relations that will need it.
- **It is harder to explain.** Two people looking at the same relation on different vantage points get different, both-correct answers. That confuses stakeholders until the distinction is explained once, properly.

The proportionate answer is rarely "make the graph bitemporal". It is to identify the two or three relations where corrections carry consequences, version those, and leave the rest as valid-time or snapshot concepts.

### Complete example

The bitemporal edge with a real correction, the current view, the `AsOf` vantage point replaying the pre-correction answer, and the audit trail:

```logica
--8<-- "docs/examples/bitemporal.l"
```

??? example "Generated SQL and execution results"

    ```text
    --8<-- "docs/examples/bitemporal.log"
    ```

## Key principles

- Entity concepts are the vertices, relationship concepts are the edges, rules are traversals.
- Every edge joins through node concepts, so referential integrity and every node-level filter come for free.
- Reuse aggressively. Once nodes and edges exist, all rules build on them instead of going back to raw tables.
- Keep the two time axes separate: valid time is what the world did, transaction time is what we knew.
- The graph *is* the agent's memory. Each new concept or rule extends what every later query can express.
