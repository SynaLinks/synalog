---
name: synalog
description: Write, validate and run Synalog programs (.l files), a Datalog-family logic language that compiles to SQL. Use when writing queries or rules over tables, modeling data as a knowledge graph, loading csv/json/parquet data, or using the synalog CLI.
---

# Synalog

Synalog is a logic programming language from the Datalog family. Programs are `.l` files made of composable rules; each predicate compiles to SQL and runs on duckdb (default), sqlite, psql, bigquery, trino, presto or databricks. Rules build on other rules, so knowledge accumulates instead of being re-derived in every query.

## Workflow

1. Put source data files (csv, tsv, json, jsonl, parquet) in `data/`.
2. Write rules in a `.l` program.
3. **Validation is automatic**: `run` (and `print`) verify the whole program before doing anything else, reporting all structural errors at once (unbound head variables, unsafe negation/aggregation, missing base cases, arity mismatches, unbounded recursion) and exiting 1 without producing SQL or output. There is no separate `check` step: fix the reported errors and re-run until it succeeds (see *Reading errors* below).
4. Execute a predicate:

```bash
synalog program.l run Predicate --load sales=data/sales.csv
synalog program.l run Predicate --csv --load sales=data/sales.csv   # machine-readable
```

CLI notes (argument order follows logica: FILE first, then the command):

- `--load TABLE=PATH` (repeatable) loads a data file as a database table; the program refers to it by the lowercase table name. duckdb reads csv/tsv/json/jsonl/parquet; sqlite csv/tsv/json/jsonl (no parquet).
- `--limit N` / `--offset N` paginate results; use them instead of reading huge outputs.
- `--engine <name>` overrides the program's `@Engine` annotation (default duckdb).
- `synalog program.l print Predicate` shows the compiled SQL without executing.
- Quick experiments without a file: `synalog -c 'Digit(d) :- d in [1, 2, 3];' run Digit`
- `-` as FILE reads the program from stdin.

## Examples

Runnable programs ship with this skill under [`examples/`](examples/). Each one validates clean and runs; read them alongside the sections below, or run them directly (`cd` into `examples/` first):

| File | Shows | Run |
| --- | --- | --- |
| [`examples/sales.l`](examples/sales.l) | Tables → concepts → rules, imports, aggregation, the temporal pipeline | `synalog sales.l run TopRegion MonthlySales --load sales=data/sales.csv` |
| [`examples/lib/metrics.l`](examples/lib/metrics.l) | A reusable `lib/` module imported by `sales.l` | `synalog lib/metrics.l run TotalByRegion --load sales=data/sales.csv` |
| [`examples/knowledge_graph.l`](examples/knowledge_graph.l) | Nodes + edges + traversal (self-contained facts) | `synalog knowledge_graph.l run TeamMate` |
| [`examples/recursion.l`](examples/recursion.l) | `@Recursive` transitive closure over an org chart | `synalog recursion.l run AllManagers` |

## Reading errors

Errors go to stderr; exit code 1 means a program error, 2 a CLI usage mistake. A failing `run` produces no partial output. There are three layers, in processing order:

**Syntax errors**: the parser stops at the *first* error and echoes the broken statement with a marker at the failure point (`<EMPTY>` where something was expected):

```
Parsing:
Bad(x) :- x ==<EMPTY>

[ Error ] Could not parse expression of a value.
```

Fix the quoted statement and re-run: later syntax errors only surface once earlier ones are fixed, so loop until it parses.

**Verification errors** (after parsing succeeds, before any SQL) are reported *all at once*, one per line, e.g. `Unbound variable 'y' in head of rule: A(x:, y:) :- B(x:)`. Fix the whole list in one pass, then re-run.

**Compile errors** (`print`/`run`) mean SQL generation failed, e.g. `Compile error: No rules are defining 'Missing', but compilation was requested.` Usually a typo in the predicate name passed to the command, or an imported predicate run by its short name (run it from its own module instead).

## Project layout

```
AGENTS.md / CLAUDE.md       agent instructions for this project
.agents/skills/synalog/     this skill
data/                       source data files, loaded with --load
lib/                        reusable modules (shared tables, metrics, graph concepts)
*.l                         top-level programs at the root, one per analysis or report
```

Keep reusable predicates in `lib/` modules and import them from top-level programs. A program should read as a composition: import shared concepts and metrics, then derive only what the question needs. When a rule is useful to more than one program, move it into a `lib/` module.

## Imports

`import path.to.file.Pred;` imports a predicate from another module: the dotted path maps to the file `path/to/file.l`, resolved against the importing file's directory, then the current directory (override with `--import-root DIR`, repeatable). [`examples/sales.l`](examples/sales.l) imports from [`examples/lib/metrics.l`](examples/lib/metrics.l) exactly this way.

```logica
# lib/metrics.l
@OrderBy(TotalByRegion, "total", "DESC");
TotalByRegion(region:, total? += amount) distinct :- sales(region:, amount:);
```

```logica
# report.l
import lib.metrics.TotalByRegion;

@OrderBy(TopRegion, "total DESC");
@Limit(TopRegion, 1);
TopRegion(region:, total:) :- TotalByRegion(region:, total:);
```

- `import lib.metrics.TotalByRegion as Totals;` imports the same predicate under another name.
- Directives attached to the imported predicate (its `@OrderBy` here) travel with it.
- Every import must be used by a rule; unused imports are an error.
- To execute an imported predicate itself, run it from its own module (`synalog lib/metrics.l run TotalByRegion`); from the importing program, run the rules that build on it (`synalog report.l run TopRegion`).

## Program structure

Programs have three sections. A database table is referenced by its database name (lowercase); the `# Tables` section maps it once to a PascalCase table predicate, and everything else builds on the predicate. See [`examples/sales.l`](examples/sales.l) for a complete program with all three sections.

```logica
@Engine("duckdb");

# Tables (read-only declarations)
Sales(region:, amount:, sold_at:) :- sales(region:, amount:, sold_at:);

# Concepts: extract entities and relationships
@OrderBy(Region, "region");
Region(region:) distinct :- Sales(region:);

# Rules: derive insights (no suffix)
@OrderBy(TotalByRegion, "total", "DESC");
TotalByRegion(region:, total? += amount) distinct :- Region(region:), Sales(region:, amount:);
```

**Naming:** name concepts plainly after the entity or relationship, with no suffixes; rules carry no suffix either.

## Critical rules

- Directives (`@OrderBy`, `@Limit`, `@Recursive`, `@Ground`) go **before** the rule they apply to.
- `@OrderBy` is **mandatory** on every concept and rule; without it pagination is non-deterministic.
- Arguments are always **named**: `Predicate(column: variable)`. LEFT = column of the predicate, RIGHT = your variable. `Orders(amount:)` is shorthand when both share the name. `Orders(total: amount)` is WRONG (looks for a column named `total`).
- Null tests: `x is null` / `x is not null`. **Never** `x != null` (silently broken).
- Count with `count? += 1`. **Never** `Count()`.
- Reuse predicates: before adding a rule, read the program and build on existing predicates instead of recomputing (define `CustomerRevenue` once; `TopCustomers` builds on it).
- For categorical columns (`status`, `type`, `tier`, ...), extract the distinct values as a concept first, then write rules over it.

## Syntax

- `#` comment; `##` description attached to the predicate that follows.
- Variables bind with `==`: `total == subtotal * 1.10`.
- Operators: arithmetic `+ - * / ^ %`; string concat `++`; comparison `== != < > <= >=`; boolean `&& || !`; membership `x in [1, 2, 3]`.
- AND/join, comma: `Orders(order_id:, pid:), Products(product_id: pid, name:)`
- OR/union, pipe `|` (UNION ALL; add `distinct` to dedupe). Defining the same predicate several times also unions the bodies.
- NOT, tilde: `Customers(customer_id:), ~Orders(customer_id:)`
- Conditional: `size == (if amount > 1000 then "large" else if amount > 100 then "medium" else "small");`
- Records: `info == {name:, email:}`.
- `Coalesce(x, y)`, `Constraint(expr)` (filter rows).
- **Never use `SqlExpr`**: the raw-SQL escape hatch is unsafe and non-portable; the verifier rejects it. Use the `Substr` → `ToInt64` → `ToString` pipeline for date/time math.

## Aggregation (in the rule head, with `distinct`)

`?` names the output column; non-aggregated columns are the grouping key.

```logica
@OrderBy(Stats, "category");
Stats(category:, total? += amount, count? += 1) distinct :- Sales(category:, amount:);
```

Operators: `+=` (sum/count), `Min=`, `Max=`, `Avg=`, `List=` (all), `Set=` (distinct), `ArgMax= item -> score`, `ArgMin=`, `ArgMaxK(x->y, k)`, `ArgMinK`, `StringAgg=`.

## Built-in functions

- String: `++`, `Substr(s, i, l)` (1-based), `Length`, `Join(l, c)`, `Split(s, c)`, `Like(s, p)` (`%` wildcard), `Upper`, `Lower`, `Format`.
- Array: `Size`, `Element(a, i)` (0-based), `ArrayConcat`, `Range(n)`.
- Casting: `ToInt64`, `ToFloat64`, `ToString`.
- Math: `Abs`, `Floor`, `Ceil`, `Round`, `Sqrt`, `Exp`, `Log`, `Sin`, `Cos`.
- User-defined: `Square(x) = x * x;`

## Temporal columns: mandatory pipeline

Never apply arithmetic or comparison directly to TIMESTAMP/DATE/DATETIME columns. Always: `ToString` → `Substr` (1-based) → `ToInt64` if arithmetic is needed.

```logica
month == Substr(ToString(created_at), 1, 7);              # "2024-01" for grouping
date  == Substr(ToString(created_at), 1, 10);             # "2024-01-15"
hour  == ToInt64(Substr(ToString(created_at), 12, 2));
ToString(created_at) >= "2024-01-01", ToString(created_at) < "2024-02-01";  # ISO range
```

`Today` (field `date:`, "YYYY-MM-DD") and `Now` (field `timestamp:`, native timestamp) are built-in concepts: never create, update or delete them. `Now` is the most precise; derive coarser parts (date, time, hour) from it via `ToString`/`Substr`.

## Recursion

Base case + recursive case, with `@Recursive(Pred, iterations)` before the rules. Use for org charts, taxonomies, BOM, referral chains. The iteration limit bounds path length, so cyclic graphs terminate. Full runnable version: [`examples/recursion.l`](examples/recursion.l).

```logica
@Recursive(AllManagers, 20);
AllManagers(employee_id:, manager_id:) :- Employees(employee_id:, manager_id:);
AllManagers(employee_id:, manager_id:) :-
  AllManagers(employee_id:, intermediate:),
  Employees(employee_id: intermediate, manager_id:);
```

Shortest paths: enumerate route costs recursively, then keep `Min=` per destination in a separate aggregating rule.

## Functors (parameterize predicates)

```logica
@OrderBy(SegmentRevenue, "segment_id");
SegmentRevenue(segment_id:, total? += amount) distinct :-
  Segment(segment_id:, user_id:), Orders(user_id:, amount:);

EnterpriseRevenue := SegmentRevenue(Segment: EnterpriseCustomer);
SMBRevenue        := SegmentRevenue(Segment: SMBCustomer);
```

## Knowledge graphs

When data has entities and relationships, model entity concepts (first column = primary key, sorted by it) and relationship concepts, then write rules that traverse. Worked example: [`examples/knowledge_graph.l`](examples/knowledge_graph.l).

- Edges join **through node concepts**, not raw tables: a node filter then applies to all edges automatically.
- Preserve URI/URL columns in nodes (`url`, `href`, `permalink`, ...); dropping them makes the node useless for action.
- Symmetric edges: define one direction raw, close with `|` swapping the endpoints. Inverse edges derive from the existing edge. N-ary relations include all participants as columns.
- Reify a relationship into a node (plus two edges) when it has attributes of its own or when other things point at it.

```logica
@OrderBy(WorksIn, "person_id");
WorksIn(person_id:, department_id:) distinct :-
  Person(person_id:),
  Department(department_id:),
  Employees(person_id:, department_id:);
```

### Temporal edges

Carry the lifetime on the edge as a **half-open** interval `[valid_from, valid_to)`, with `"9999-12-31"` as the open end. ISO strings compare correctly, so there is no null handling and no date arithmetic. Extract the bounds with the temporal pipeline.

- Valid now: `Today(date:), valid_from <= date, date < valid_to`.
- Overlap of `[s1, e1)` and `[s2, e2)`: `s1 < e2 && s2 < e1`. A derived edge carries the intersection and exists only if it is non-empty:

```logica
valid_from == (if a_from > b_from then a_from else b_from),
valid_to   == (if a_to < b_to then a_to else b_to),
valid_from < valid_to;
```

- Event log with no end date: close each period with the next change, and the open one with negation.

```logica
@OrderBy(NextChange, "person_id", "changed_at");
NextChange(person_id:, changed_at:, next? Min= later) distinct :-
  Assignments(person_id:, changed_at:),
  Assignments(person_id:, changed_at: later),
  later > changed_at;

MemberOf(person_id:, team_id:, valid_from:, valid_to:) distinct :-
  Assignments(person_id:, team_id:, changed_at: valid_from),
  NextChange(person_id:, changed_at: valid_from, next: valid_to);
MemberOf(person_id:, team_id:, valid_from:, valid_to:) distinct :-
  Assignments(person_id:, team_id:, changed_at: valid_from),
  ~NextChange(person_id:, changed_at: valid_from),
  valid_to == "9999-12-31";
```

- Time-respecting traversal: carry the interval intersection through the recursive rule, so a path only exists when its hops are valid simultaneously.

### Bitemporal edges

Add `recorded_from`/`recorded_to` (when the database believed the fact) next to `valid_from`/`valid_to` (when the fact was true in the world). Valid time is editable, transaction time is append-only: correct a fact by closing `recorded_to` on the old version and inserting a new version, never by overwriting.

- Current view: match `recorded_to: "9999-12-31"` in the argument list, then test valid time against `Today`.
- As-of queries: put the vantage point in a swappable predicate and move it with a functor.

```logica
AsOf(valid_date:, known_date:) :-
  Today(date:), valid_date == date, known_date == date;

@OrderBy(EmploymentSnapshot, "person_id");
EmploymentSnapshot(person_id:, role:) distinct :-
  AsOf(valid_date:, known_date:),
  EmployedAt(person_id:, role:, valid_from:, valid_to:, recorded_from:, recorded_to:),
  valid_from <= valid_date, valid_date < valid_to,
  recorded_from <= known_date, known_date < recorded_to;

March2026(valid_date: "2026-03-01", known_date: "2026-03-01");
EmploymentAsKnownInMarch := EmploymentSnapshot(AsOf: March2026);
```

- A closed `recorded_to` with a successor version is a correction; with no successor it is a retraction. Ending a fact in the world moves `valid_to`, never `recorded_to`.
- Composing two bitemporal edges intersects both axes, and both intersections must be non-empty.
