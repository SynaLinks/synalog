## LOGICA PROGRAM STRUCTURE

Tables are read-only. A database table is referenced by its database name (lowercase, as it exists in the database); the `# Tables` section maps it once to a PascalCase table predicate, and everything else builds on the predicate. Programs have three sections:

```logica
# Tables
TableName(col1:, col2:) :- database_table(col1:, col2:);

# Concepts
@OrderBy(EntityNode, "field1");
EntityNode(field1:, field2:) distinct :- TableName(field1:, field2:);

@OrderBy(RelationEdge, "field1");
RelationEdge(field1:, field2:) distinct :- TableName(field1:, field2:);

# Rules
@OrderBy(RuleName, "total", "desc");
RuleName(field1:, total? += amount) distinct :- TableName(field1:, amount:);
```

**Naming:** Entity concepts → `*Node`. Relationship concepts → `*Edge`. Rules → no suffix.

**CRITICAL:**
- Directives (`@OrderBy`, `@Limit`, `@Recursive`, `@Ground`) go BEFORE the rule.
- The section headers are plain comments — a convention, not syntax.
- `@OrderBy` is MANDATORY on every concept and rule (otherwise pagination is non-deterministic).

## LANGUAGE REFERENCE

### Comments
- `#` = comment.
- `##` = description (attached to the predicate that follows).

### Named Arguments
Format: `Predicate(column_name: variable)`. LEFT = column from predicate, RIGHT = your variable name.
- `Orders(amount: total)` → column `amount` bound to var `total`.
- `Orders(amount:)` → shorthand when var name = column name.
- `Orders(total: amount)` → WRONG (looks for column `total`).

### Variables and Operators
Variables defined via `==`. Example: `total == subtotal * 1.10`.

- Arithmetic: `+ - * / ^ %`
- String concat: `++`
- Comparison: `== != < > <= >=`
- Boolean: `&& || !`
- Null: `x is null`, `x is not null` (NEVER `x != null` — silently broken)
- Membership: `x in [1, 2, 3]`

### Logical Operators
- **AND/Join** — comma `,`: `Orders(order_id:, pid:), Products(product_id: pid, name:)`
- **OR/Union** — pipe `|`: combines results (UNION ALL). Use `distinct` to dedupe.
- **NOT** — tilde `~`: `Customers(customer_id:), ~Orders(customer_id:)`
- **Multiple rule defs**: same predicate name multiple times = union of bodies.

```logica
@OrderBy(ContactableCustomer, "customer_id");
ContactableCustomer(customer_id:, channel:) distinct :-
  Customers(customer_id:, email:), email is not null, channel == "email" |
  Customers(customer_id:, phone:), phone is not null, channel == "phone";
```

### Null Handling
```logica
MissingEmail(user_id:) :- Users(user_id:, email:), email is null;
HasEmail(user_id:, email:) :- Users(user_id:, email:), email is not null;
UserDisplay(user_id:, name:) :- Users(user_id:, full_name:), name == Coalesce(full_name, "Anonymous");
```

### Records
```logica
UserInfo(user_id:, info:) :- Users(user_id:, name:, email:), info == {name:, email:};
```

### Aggregation (in rule HEAD with `distinct`)
- `+=` Sum/Count: `total? += amount`, `count? += 1`
- `Max=`, `Min=`, `Avg=`
- `List=` (all), `Set=` (distinct)
- `ArgMax= item -> score`, `ArgMin= item -> score`

`?` names the output column.

```logica
@OrderBy(Stats, "category");
Stats(category:, total? += amount, count? += 1) distinct :- Sales(category:, amount:);
```

**NEVER use `Count()` — use `+= 1` instead.**

### Conditional
```logica
size == (if amount > 1000 then "large" else if amount > 100 then "medium" else "small");
```

### Directives
- `@OrderBy(Pred, "col1", "col2 DESC")` — sort order. **Mandatory.**
- `@Limit(Pred, n)` — row limit.
- `@Recursive(Pred, iterations, stop?, satellites?)` — recursion control.
- `@Ground(Pred)` — force materialization (for performance).

### Built-in Functions

**Aggregating:** `Sum= +=`, `Min=`, `Max=`, `Avg=`, `Count=`, `List=`, `Set=`, `Array= x->y`, `ArgMin= x->y`, `ArgMax= x->y`, `ArgMinK(x->y, k)`, `ArgMaxK(x->y, k)`, `StringAgg= x`, `1= x`.

**String:** `++`, `Substr(s, i, l)` (1-based), `Length`, `Join(l, c)`, `Split(s, c)`, `Like(s, p)` (`%` wildcard), `Upper`, `Lower`, `Format`.

**Array:** `Size`, `Element(a, i)` (0-based), `ArrayConcat`, `Range(n)`.

**Casting:** `ToInt64`, `ToFloat64`, `ToString`.

**Math:** `Abs`, `Floor`, `Ceil`, `Round`, `Sqrt`, `Exp`, `Log`, `Sin`, `Cos`.

**Other:** `IsNull(x)`, `Coalesce(x, y, z)`, `Constraint(expr)` (filter rows), `SqlExpr(s, r)` (raw SQL escape hatch).

### User-defined Functions
```logica
Square(x) = x * x;
FullName(first, last) = first ++ " " ++ last;
```

### Functors (parameterize predicates)
```logica
NewPredicate := FunctorPredicate(Arg1: Value1, Arg2: Value2);
```

```logica
@OrderBy(SegmentRevenue, "segment_id");
SegmentRevenue(segment_id:, total? += amount) distinct :-
  Segment(segment_id:, user_id:), Orders(user_id:, amount:);

EnterpriseRevenue := SegmentRevenue(Segment: EnterpriseCustomer);
SMBRevenue        := SegmentRevenue(Segment: SMBCustomer);
```

**Filter pattern:** generic rule with a `Filter` dependency, then an ephemeral filter override appended at query time.
```logica
@OrderBy(CustomerRevenue, "customer_name");
CustomerRevenue(customer_name:, revenue? += amount) distinct :-
  Filter(customer_name:), Orders(customer_name:, amount:);
Filter(customer_name:) distinct :- Orders(customer_name:);   # default = all rows

# Ephemeral override appended at query time:
JohnFilter(customer_name: "John");
JohnsRevenue := CustomerRevenue(Filter: JohnFilter);
```

### Recursive Predicates (Transitive Closure)
Define base case + recursive case. Use for org charts, taxonomies, BOM, referral chains.

```logica
@Recursive(AllManagers, 20);
AllManagers(employee_id:, manager_id:) :- Employees(employee_id:, manager_id:);
AllManagers(employee_id:, manager_id:) :-
  AllManagers(employee_id:, intermediate:),
  Employees(employee_id: intermediate, manager_id:);
```

### Shortest Paths (SSSP)
Use `Min=` aggregation in recursion — handles cycles automatically.

```logica
ShippingCost("warehouse_main") = 0;
ShippingCost(destination) Min= cost :-
  ShippingRoutes(origin: "warehouse_main", destination:, cost:);
ShippingCost(destination) Min= ShippingCost(hub) + cost :-
  ShippingCost(hub),
  ShippingRoutes(origin: hub, destination:, cost:);
```

### Temporal Data — CRITICAL Pipeline
For TIMESTAMP/DATE/DATETIME/TIME columns, ALWAYS:
1. `ToString(x)` first
2. `Substr(s, i, l)` to extract part (1-based)
3. `ToInt64(x)` if you need arithmetic

**NEVER** apply arithmetic/comparison directly to temporal columns.

```logica
# Year-month for grouping
month == Substr(ToString(created_at), 1, 7);    # "2024-01"
# Date only
date == Substr(ToString(created_at), 1, 10);    # "2024-01-15"
# Hour as int
hour == ToInt64(Substr(ToString(timestamp), 12, 2));
# Year/month as ints
year  == ToInt64(Substr(date_str, 1, 4));
month == ToInt64(Substr(date_str, 6, 2));
day   == ToInt64(Substr(date_str, 9, 2));
```

ISO-format string comparison works for date ranges:
```logica
ToString(created_at) >= "2024-01-01", ToString(created_at) < "2024-02-01";
```

**`CurrentDate`** — built-in concept with field `date:` ("YYYY-MM-DD"). Use for "today's date". DO NOT create/update/delete it.
```logica
ThisMonthOrders(order_id:, created_at:) :-
  Orders(order_id:, created_at:),
  CurrentDate(date:),
  Substr(ToString(created_at), 1, 7) == Substr(date, 1, 7);
```

### Reuse and Compose Predicates (CRITICAL)
Before adding a new concept/rule, check which predicates already exist and reuse them.

**BAD** — recompute revenue in every rule that needs it.
**GOOD** — define `CustomerRevenue` once, then `TopCustomers` builds on it:
```logica
@OrderBy(CustomerRevenue, "customer_id");
CustomerRevenue(customer_id:, total? += amount) distinct :- Orders(customer_id:, amount:);

@OrderBy(TopCustomers, "total DESC");
@Limit(TopCustomers, 10);
TopCustomers(customer_id:, total:) :- CustomerRevenue(customer_id:, total:);
```

### Categorical Data — Extract Categories First
For columns like `status`, `type`, `tier`, `category`, `country` — extract distinct values as a concept BEFORE writing rules over them. This gives consistency, reuse, discoverability.

```logica
@OrderBy(OrderStatus, "status");
OrderStatus(status:) distinct :- Orders(status:);

@OrderBy(OrdersByStatus, "status");
OrdersByStatus(status:, count? += 1) distinct :- OrderStatus(status:), Orders(status:);
```

## KNOWLEDGE GRAPHS

When the data has entities and relationships, model as a graph: `*Node` concepts (vertices) + `*Edge` concepts (connections), then rules traverse.

**Conventions:**
- **Primary key first**: first column of every concept is its PK; sort by it with `@OrderBy`.
- **Preserve URIs/URLs** in nodes (`url`, `href`, `link`, `website`, `profile_url`, `image_url`, `permalink`, `homepage`, etc.). Dropping them makes the concept useless for action — never silently omit.
- **Edges join through nodes**, not raw tables. Guarantees referential integrity: a node filter automatically applies to all edges.

```logica
@OrderBy(PersonNode, "person_id");
PersonNode(person_id:, name:, role:) distinct :- Employees(person_id:, name:, role:);

@OrderBy(WorksInEdge, "person_id");
WorksInEdge(person_id:, department_id:) distinct :-
  PersonNode(person_id:),
  DepartmentNode(department_id:),
  Employees(person_id:, department_id:);
```

### Edge Patterns

**N-ary** (>2 entities): include all participants as columns.
```logica
WorksOnEdge(person_id:, project_id:, role:) distinct :-
  PersonNode(person_id:), ProjectNode(project_id:),
  ProjectAssignments(person_id:, project_id:, role:);
```

**Weighted** — numeric attribute on the edge.
```logica
PurchasedEdge(customer_id:, product_id:, total_amount? += amount) distinct :-
  CustomerNode(customer_id:), ProductNode(product_id:),
  Orders(customer_id:, product_id:, amount:);
```

**Type/status as separate nodes/edges** — when an entity or relationship has distinct categorical states, model one concept per state (e.g., `ActiveUserNode`, `ChurnedUserNode`, `ActiveContractEdge`, `TerminatedContractEdge`) joined through the base node.

**Symmetric** — define raw direction (`a < b`), then close with `|`:
```logica
CoAuthoredEdge(author_a:, author_b:, paper_id:) distinct :-
  CoAuthoredRaw(author_a:, author_b:, paper_id:) |
  CoAuthoredRaw(author_a: author_b, author_b: author_a, paper_id:);
```

**Inverse** — derive opposite-direction edge from existing one:
```logica
ReportsToEdge(employee_id:, manager_id:) distinct :- ManagesEdge(manager_id:, employee_id:);
```

**Acyclic check** — recursive closure detects cycles:
```logica
@Recursive(AncestorOf, 100);
AncestorOf(ancestor_id:, descendant_id:) :- ParentOfEdge(parent_id: ancestor_id, child_id: descendant_id);
AncestorOf(ancestor_id:, descendant_id:) :-
  AncestorOf(ancestor_id:, intermediate:),
  ParentOfEdge(parent_id: intermediate, child_id: descendant_id);
HierarchyCycle(node_id:) :- AncestorOf(ancestor_id: node_id, descendant_id: node_id);
```

**Cardinality** — count children per parent and filter for violations.

**Composition** — chain different edge types: `A→B via R1`, `B→C via R2` ⇒ `A→C`.
```logica
WorksWithClientEdge(employee_id:, client_id:) distinct :-
  MemberOfEdge(employee_id:, team_id:),
  EngagedWithEdge(team_id:, client_id:);
```

**Chains** — recursive over the same edge type (parent→child, manager→employee).

**Paths** — track the route, not just endpoints. Use `List=` or string concat in recursive rules.

### Temporal Edges
Include `start_date`/`end_date` (extracted via the temporal pipeline). Then:
- "Active today": `start_date <= date AND end_date >= date` with `CurrentDate`.
- Overlap: `s1 <= e2 AND s2 <= e1`.
- Compose temporal relations: chain through time-aware edges.

```logica
@OrderBy(MemberOfEdge, "employee_id");
MemberOfEdge(employee_id:, team_id:, start_date:, end_date:) distinct :-
  EmployeeNode(employee_id:), TeamNode(team_id:),
  TeamAssignments(employee_id:, team_id:, started_at:, ended_at:),
  start_date == Substr(ToString(started_at), 1, 10),
  end_date   == Substr(ToString(ended_at), 1, 10);

@OrderBy(CurrentMember, "employee");
CurrentMember(employee:, team:) :-
  MemberOfEdge(employee_id:, team_id:, start_date:, end_date:),
  EmployeeNode(employee_id:, name: employee),
  TeamNode(team_id:, name: team),
  CurrentDate(date:),
  start_date <= date, end_date >= date;
```

### Key Principles
- Nodes (`*Node`) = entities; Edges (`*Edge`) = relationships; Rules = traversals/queries.
- Every edge joins through node concepts for referential integrity.
- Reuse aggressively — once nodes and edges exist, all rules build on them.
