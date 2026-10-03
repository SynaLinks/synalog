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
| **Specs and proofs** | A `@Proof` with no matching `@Spec`, a spec stated or proved twice, malformed `@Spec` / `@Proof` |

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

## Specs and proofs

A program can state properties of its predicates with `@Spec` and justify them with `@Proof`. The statement and the proof are written in [Lean](https://lean-lang.org/):

```logica
# 1. The contract, written first
@Spec(Ancestor,
      transitive: "∀ x y z, Ancestor x y → Ancestor y z → Ancestor x z",
      grounded:   "∀ x y, Ancestor x y → ∃ w, parent x w");

# 2. The predicate
@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), parent(x: y, y: z);

# 3. The evidence
@Proof(Ancestor, transitive: "intro x y z h1 h2; induction h2 <;> aesop");
```

Both take the predicate first, then one named argument per property. The name pairs a proof with its spec. Use a triple-quoted string (`"""..."""`) for text that spans several lines.

The two are separate on purpose. The statement lives only in `@Spec`, so whoever writes the proof, typically an agent, cannot weaken what is being proved.

!!! warning "Proofs are not checked yet"
    Synalog pairs specs with proofs and reports where each spec stands, but it does not run Lean yet. A spec with a proof is reported as `unverified`, never as proven.

[`specs()`](python-api.md#specs) reports every spec and its status:

| Status | Meaning |
|--------|---------|
| `pending` | The predicate is not defined yet. A spec can be written before its predicate. |
| `unproven` | The predicate is defined but the spec has no `@Proof`. |
| `unverified` | A `@Proof` is written but has not been checked. |

```python
for spec in synalog.specs(source):
    print(spec["predicate"], spec["name"], spec["status"])
# Ancestor transitive unverified
# Ancestor grounded unproven
```

None of these statuses is an error. `check()` reports `unproven` and `unverified` specs as warnings, which the CLI prints on `print` and `run` without failing:

```python
errors, warnings = synalog.check(source)
# errors:   []
# warnings: ["Proof of 'Ancestor.transitive' is unverified: proofs are not checked yet",
#            "Spec 'Ancestor.grounded' is unproven: no matching @Proof"]
```

As errors, `check()` only rejects annotations that can never become valid:

| Error | Cause |
|-------|-------|
| `Proof of 'P.name' has no matching @Spec` | A `@Proof` names a property that no `@Spec` of that predicate states |
| `Duplicate spec 'P.name'` | The same name is stated twice for a predicate |
| `Duplicate proof of 'P.name'` | The same name is proved twice for a predicate |
| `Malformed @Spec` / `Malformed @Proof` | The annotation is not `(Predicate, name: "text", ...)` |

Specs and proofs do not change the generated SQL. Those of an imported predicate travel with it.

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
