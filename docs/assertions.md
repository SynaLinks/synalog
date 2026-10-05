# Assertions

A rule says how to compute a predicate. An assertion says what the result must satisfy: Ancestor is transitive, every order belongs to a known customer, the shares of a total add up to one. Synalog checks each assertion against the data, and refuses a program whose assertions are violated.

!!! note "New in Synalog 2.0"
    Assertions are specific to Synalog: neither Datalog nor Logica has them. See [Differences with Datalog](differences-datalog.md#assertions-new-in-synalog) and [Differences with Logica](differences.md#assertions-new-in-synalog).

Assertions are written in first-order logic, not in Synalog. A rule and its assertion state the same intent in two different notations, so a mistake made in one is unlikely to be repeated in the other. This makes them a good contract for a program written by an agent: state what the predicate must satisfy first, then let the rules be written, and checked, against it.

## A first assertion

```logica
Parent(x:, y:) :- parents(parent: x, child: y);

@Assert(Ancestor,
      transitive:  "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z",
      irreflexive: "∀ x, ¬ Ancestor x x");

@Recursive(Ancestor, 20);
@OrderBy(Ancestor, "x", "y");
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);

# Two generations apart, wrongly claimed transitive.
@Assert(Grandparent, transitive: "∀ x y z, Grandparent x y → Grandparent y z → Grandparent x z");
@OrderBy(Grandparent, "x", "y");
Grandparent(x:, y: z) :- Parent(x:, y:), Parent(x: y, y: z);
```

`verify` runs every assertion against the data and prints the counterexamples of those that do not hold. With five generations, from Alice to Erin:

```text
$ synalog family.l verify --load parents=parents.csv
✓ Ancestor.transitive holds
✓ Ancestor.irreflexive holds
✗ Grandparent.transitive is violated: ∀ x y z, Grandparent x y → Grandparent y z → Grandparent x z
  1 counterexample:
+-------+-------+------+
| x     | y     | z    |
+-------+-------+------+
| alice | carol | erin |
+-------+-------+------+
```

Carol is Alice's grandchild, Erin is Carol's, but Erin is Alice's great-grandchild: the claim is wrong, and the counterexample says exactly where.

## Writing an assertion

`@Assert` takes the predicate the properties are about, then one named argument per property: the name identifies the property in reports, the string is the statement.

```logica
@Assert(Revenue,
      one_row_per_customer: "∀ c r s, Revenue c r → Revenue c s → r = s",
      positive:             "∀ c, Revenue c > 0");
```

- A predicate may have several `@Assert` annotations; a name may appear only once per predicate.
- A statement that spans several lines goes in a triple-quoted string (`"""..."""`).
- An assertion can be written before its predicate exists: it waits, as `pending`, until the predicate is defined. Write the contract first.
- Assertions do not change the generated SQL.

## The statement language

Statements are written as [Lean](https://lean-lang.org/) propositions, with the same operator precedence. Every symbol has an ASCII spelling:

| Symbol | ASCII | Meaning |
|--------|-------|---------|
| `∀ x y, F` | `forall x y, F` | `F` holds for all `x`, `y` |
| `∃ x, F` | `exists x, F` | `F` holds for some `x` |
| `F → G` | `F -> G` | if `F` then `G` (associates to the right) |
| `F ↔ G` | `F <-> G` | `F` exactly when `G` |
| `F ∧ G`, `F ∨ G`, `¬ F` | `F /\ G`, `F \/ G`, `not F` | and, or, not |
| `=`, `≠`, `<`, `≤`, `>`, `≥` | `=`, `!=`, `<`, `<=`, `>`, `>=` | comparisons |
| `+`, `-`, `*`, `/` | | arithmetic |
| `∑ x, t` | `sum x, t` | sum of `t` over `x` |

```logica
@Assert(Revenue, consistent: """forall c r s,
                                Revenue c r -> Revenue c s -> r = s""");
```

### Predicates are applied by position

Synalog predicates have named columns; in a statement they take their arguments by position, in the order the predicate's first rule declares its columns.

- Applied to all its columns, a predicate is a **relation**, true or false: with `Ancestor(x:, y:)`, `Ancestor a b` holds when `Ancestor(x: a, y: b)` is a row.
- Applied to all but its last column, it is a **function** returning the last one: with `Revenue(customer_id:, revenue:)`, the term `Revenue c` is the revenue of customer `c`, so `∀ c, Revenue c > 0` reads "every revenue is positive".

A name bound by a quantifier is a variable; an unbound lowercase name is universally quantified. Literals are numbers and double-quoted strings.

## What to assert

The properties worth stating are the ones a rule can silently get wrong. All of these run as written against the tables `orders(order_id, customer_id, amount, status)` and `customers(customer_id, country)`:

```logica
Order(order_id:, customer_id:, amount:, status:) :- orders(order_id:, customer_id:, amount:, status:);
Customer(customer_id:, country:) :- customers(customer_id:, country:);

@Assert(Revenue,
      one_row_per_customer: "∀ c r s, Revenue c r → Revenue c s → r = s",
      known_customer:       "∀ c r, Revenue c r → ∃ k, Customer c k",
      positive:             "∀ c, Revenue c > 0");
@OrderBy(Revenue, "customer_id");
Revenue(customer_id:, revenue? += amount) distinct :- Order(customer_id:, amount:, status: "delivered");

@Assert(Share,
      sums_to_one: "∑ c, Share c = 1",
      bounded:     "∀ c, 0 ≤ Share c ∧ Share c ≤ 1");
Total(total? += revenue) distinct :- Revenue(revenue:);
@OrderBy(Share, "customer_id");
Share(customer_id:, share:) :- Revenue(customer_id:, revenue:), Total(total:), share == ToFloat64(revenue) / ToFloat64(total);
```

| Property | Statement | Catches |
|---|---|---|
| A key | `∀ c r s, Revenue c r → Revenue c s → r = s` | a join that duplicates rows, a missing `distinct` |
| A reference | `∀ c r, Revenue c r → ∃ k, Customer c k` | orphan rows, a filter applied on one side only |
| A bound | `∀ c, 0 ≤ Share c ∧ Share c ≤ 1` | a wrong denominator, an integer division |
| A total | `∑ c, Share c = 1` | rows lost or counted twice |
| A sign | `∀ c, Revenue c > 0` | refunds or cancellations counted as sales |
| Transitivity | `∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z` | a recursion that stops too early |
| Irreflexivity | `∀ x, ¬ Ancestor x x` | a cycle in the data, an edge in the wrong direction |
| A period | `∀ p t f u, MemberOf p t f u → f < u` | an interval closed before it opens |

Here `known_customer` finds a real problem in the data: an order of customer 12, who is not in `customers`.

```text
✗ Revenue.known_customer is violated: ∀ c r, Revenue c r → ∃ k, Customer c k
  1 counterexample:
+----+----+
| c  | r  |
+----+----+
| 12 | 20 |
+----+----+
```

## Checking assertions

An assertion is checked by looking for its counterexamples: Synalog compiles that search to SQL, one column per variable of the statement's leading `∀` (and per name it quantifies implicitly), and runs it on the database like any predicate. The assertion holds when the query returns no row.

| Where | What happens |
|---|---|
| `synalog program.l verify [Predicate ...]` | Runs every assertion, or those of the given predicates, and prints the counterexamples of each violated one (5 by default, `--limit` to change). Exits 1 if one is violated. |
| `synalog program.l run Predicate` | Checks the program's assertions before it prints anything, and exits 1 with a few counterexamples if one is violated. |
| `synalog program.l print Predicate` | Never touches the database: assertions are not run. |
| [`check()`](python-api.md#check) | Runs the assertions when a database is known: inside a project whose `synalog.toml` has a `[connection]`, or given a `dsn`. Each violated assertion is an error. `assertions=False` keeps it offline. |

```text
$ synalog family.l run Grandparent --load parents=parents.csv
Assertion 'Grandparent.transitive' is violated: ∀ x y z, Grandparent x y → Grandparent y z → Grandparent x z
  counterexamples (x, y, z): (alice, carol, erin)
```

From Python, [`assertions()`](python-api.md#assertions) lists the assertions and their status, and [`counterexamples()`](python-api.md#counterexamples) returns the SQL of the search, to run anywhere:

```python
for a in synalog.assertions(source):
    print(a["predicate"], a["name"], a["status"])

sql = synalog.counterexamples(source, "Revenue", "known_customer")
```

!!! warning "A check, not a proof"
    An assertion that holds has no counterexample *in the data it was run on*, and says nothing about other data. `Grandparent.transitive` holds on a family of four generations, because no counterexample can exist there yet, and fails on five. Run assertions on representative data.

### What can be checked

Counterexamples are searched in the database, which bounds what a statement can say:

- every variable must be bound by a predicate: `∀ x, x > 0` ranges over nothing and cannot be checked;
- a variable that a predicate is applied to only inside a nested formula ranges over where that predicate is defined: `∀ e, ∃ o, Pay o ≥ Pay e + 10` is checked for every `e` with a `Pay`;
- a statement cannot apply a raw table, whose columns are not declared: wrap the table in a predicate (`Order` above, over `orders`);
- an equation between functions is checked where both sides are defined, so a missing row is not a counterexample;
- equality between computed numbers (arithmetic, sums) is checked up to `1e-9`.

## Status

Each assertion has a status, which `assertions()` reports:

| Status | Meaning |
|--------|---------|
| `pending` | A predicate the assertion names is not defined yet. |
| `unchecked` | The statement can be checked against a database. |
| `unsupported` | The statement is well-formed but cannot be checked against a database. |

`check()` reports an `unsupported` assertion as a warning, `Assertion 'Order.free' cannot be checked: variable 'x' is not bound by a predicate, so it has no values to check`, and as errors only the assertions that can never become valid:

| Error | Cause | Fix |
|-------|-------|-----|
| `Invalid assertion 'P.name': …` | The statement does not parse, or applies a predicate to the wrong number of arguments | Fix the statement; count the predicate's columns |
| `Duplicate assertion 'P.name': …` | The same name is stated twice for a predicate | Give each property its own name |
| `Malformed @Assert: …` | The annotation is not `@Assert(Predicate, name: "statement", ...)` | One named argument per property |
| `Assertion 'P.name' is violated: …` | The data holds a counterexample | Fix the rule, or the assertion if it was wrong |
