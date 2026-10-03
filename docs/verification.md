# Verification

Unlike Logica, which lets the database raise errors at execution time, Synalog embeds a **formal verifier** that catches issues at compile time before any SQL is generated, and before anything touches a database.

This matters most for AI agents: it prevents producing programs that parse correctly but fail at execution time, a common failure mode when generating SQL directly.

## Checks

| Check | What it detects |
|-------|-----------------|
| **Safety** | Head variables not bound in the body |
| **Safe negation** | Negated variables without a positive occurrence |
| **Safe aggregation** | Aggregated variables not bound outside the aggregate |
| **Stratification** | Negative recursion cycles |
| **Arity** | Predicates used with inconsistent argument counts |
| **Recursion** | Missing base cases, trivial loops, unbounded recursion without `@Recursive` |
| **Reserved names** | Rules that redefine a built-in library predicate (`Num`, `Str`, `ArgMin`, `Today`, `Now`, ...) |
| **Unsafe `SqlExpr`** | User rules that reach for the raw-SQL escape hatch |
| **Specs** | A `@Spec` statement that does not parse or contradicts the program, a spec stated twice, a `@Proof` with no matching `@Spec` |

### Unsafe `SqlExpr`

`SqlExpr("...", {...})` injects a raw SQL string straight into the compiled query: unparsed, untyped, unverified and rarely portable across engines, defeating the guarantees Synalog exists to provide. It is reserved for the built-in library (which uses it for `ArgMin`/`ArgMax`/regex/...); user programs that call it are rejected:

```python
errors, warnings = synalog.check('''
  TenMinutesAgo(timestamp:) :-
    Now(timestamp: now),
    timestamp == SqlExpr("{t} - INTERVAL 10 MINUTE", {t: now});
''')
# ["Unsafe SqlExpr in rule 'TenMinutesAgo': raw SQL bypasses verification and portability"]
```

The safe alternative is to express the logic in Synalog. For date/time math, stay on the string→int pipeline (`Substr` → `ToInt64` → `ToString`); see [temporal data](language/temporal.md#relative-dates-and-times).

## Specs

A program can state, with `@Spec`, what its predicates are meant to compute. The statement is first-order logic with arithmetic and sums, not Synalog, so a mistake in a rule is unlikely to be repeated in its spec:

```logica
# 1. The contract, written first
@Spec(Ancestor,
      transitive:  "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z",
      irreflexive: "∀ x, ¬ Ancestor x x",
      grounded:    "∀ x y, Ancestor x y → ∃ w, Parent x w");

# 2. The predicate
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);
```

`@Spec` takes the predicate the properties are about, then one named argument per property. Use a triple-quoted string (`"""..."""`) for a statement that spans several lines.

### The statement language

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

Statements are positional while Synalog predicates have named columns. The arguments of a predicate are its columns in the order its first rule declares them:

- applied to all its columns, a predicate is a relation: `Ancestor x y` reads `Ancestor(x: x, y: y)`;
- applied to all but the last, it is a function returning the last one: with `Posterior(h:, e:, p:)`, the term `Posterior h e` is `p`.

```logica
@Spec(Posterior,
      definition: "∀ h e, Posterior h e = Joint h e / Evidence e",
      normalised: "∀ e, ∑ h, Posterior h e = 1",
      bounded:    "∀ h e, 0 ≤ Posterior h e ∧ Posterior h e ≤ 1");
```

A name bound by a quantifier is a variable; an unbound lowercase name is universally quantified. Literals are numbers and double-quoted strings.

### Checking a spec

A spec is checked against a database by looking for its counterexamples. Synalog compiles that search to SQL like any predicate, one column per universally quantified variable; the spec holds on the database when the query returns no row.

```python
sql = synalog.counterexamples(source, "Ancestor", "transitive")
```

From the command line, [`verify`](cli.md) runs every spec and prints the counterexamples of those that do not hold:

```text
$ synalog family.l verify
✓ Ancestor.transitive holds
✓ Ancestor.irreflexive holds
✗ Near.transitive is violated: ∀ x y z, Near x y → Near y z → Near x z
  2 counterexamples:
| x | y | z |
| a | b | d |
| a | c | d |
```

!!! warning "A check, not a proof"
    A spec that holds has no counterexample *in the data it was run on*. It says nothing about other data.

Counterexamples are searched in the database, which bounds what can be checked:

- every variable must be bound by a predicate: `∀ x, x > 0` ranges over nothing and cannot be checked;
- a statement cannot apply a raw table, whose columns are not declared: wrap the table in a predicate;
- an equation between functions is checked where both sides are defined, so a missing row is not a counterexample;
- equality between computed numbers (arithmetic, sums) is checked up to `1e-9`.

### Status

[`specs()`](python-api.md#specs) reports every spec and where it stands:

| Status | Meaning |
|--------|---------|
| `pending` | A predicate the spec names is not defined yet. A spec can be written before its predicates. |
| `unchecked` | The statement can be checked against a database. |
| `unsupported` | The statement is well-formed but cannot be checked against a database. |

`check()` reports an `unsupported` spec as a warning, and as errors only the specs that can never become valid:

| Error | Cause |
|-------|-------|
| `Invalid spec 'P.name'` | The statement does not parse, or applies a predicate to the wrong number of arguments |
| `Duplicate spec 'P.name'` | The same name is stated twice for a predicate |
| `Malformed @Spec` | The annotation is not `(Predicate, name: "text", ...)` |

Specs do not change the generated SQL.

### Proofs

`@Proof(Predicate, name: "...")` attaches a proof text to the spec of the same predicate and name. It is recorded and returned by `specs()`, but not checked. A `@Proof` with no matching `@Spec` is an error.

## Usage

Verification runs through [`check()`](python-api.md#check):

```python
import synalog

bad_source = """
Test(x:, y:) :- Numbers(x:);
"""

errors, warnings = synalog.check(bad_source)
for e in errors:
    print(e)
# Unbound variable 'y' in head of rule: Test(x:, y:) :- Numbers(x:)
```

`check()` returns the errors and the warnings as two lists. No error means the program is structurally valid and safe to compile; warnings do not make it invalid.

!!! tip "Check before you compile"
    In an agent loop, always run `check()` first and feed the error messages back to the model. The messages are written to be actionable: they name the predicate, the variable, and the violated rule.

## Complete example

An intentionally invalid program (an unbound head variable, an unbounded self-recursion and a reserved predicate name), and everything the verifier reports for it:

```logica
--8<-- "docs/examples/verification.l"
```

??? example "Verifier output"

    ```text
    --8<-- "docs/examples/verification.log"
    ```
