# Verifier Tests

These are **negative test cases** that our verifier catches but **Python Logica does not**.
Each file contains valid Logica syntax that compiles with Python Logica but violates semantic rules.

## Why These Tests Matter

Python Logica compiles these programs to SQL, but the generated SQL may:
- Cause infinite loops at runtime
- Produce undefined/inconsistent results
- Violate Datalog stratification requirements

Our verifier catches these errors **before** compilation.

## Test Categories

### Unsafe Negation (Python Logica: compiles, Our Verifier: catches)

| File | Error | Description |
|------|-------|-------------|
| `03_unsafe_negation.l` | `unsafeNegation` | Negated variable not bound positively |
| `04_unsafe_negation_unbound.l` | `unsafeNegation` | Negated variable completely unbound |
| `14_nested_negation_unbound.l` | `unsafeNegation` | Unbound in nested negation |
| `22_unsafe_negation_in_disjunction.l` | `unsafeNegation` | Unbound var in negation inside disjunction |
| `33_negation_unbound_in_combine.l` | `unsafeNegation` | Unbound in negated subquery |

### Stratification Errors (Python Logica: compiles, Our Verifier: catches)

| File | Error | Description |
|------|-------|-------------|
| `05_negative_cycle.l` | `StratificationError` | Two predicates in negative cycle |
| `06_negative_self_recursion.l` | `StratificationError` | Predicate negates itself |
| `07_three_way_negative_cycle.l` | `StratificationError` | Three predicates in cycle |
| `15_complex_negative_cycle.l` | `StratificationError` | Mixed positive/negative cycle |
| `20_negation_in_disjunction_cycle.l` | `StratificationError` | Negative cycle through disjunction |
| `29_double_negation_cycle.l` | `StratificationError` | Three-way negative cycle P->Q->R->P |
| `34_self_negation_direct.l` | `StratificationError` | Predicate directly negates itself |
| `35_mixed_positive_negative_cycle.l` | `StratificationError` | Cycle with mixed positive/negative edges |

### Unbounded Recursion (Python Logica: compiles, Our Verifier: catches)

| File | Error | Description |
|------|-------|-------------|
| `19_unbounded_recursion.l` | `unboundedRecursion` | Missing @Recursive annotation |
| `32_multiple_unbounded_recursive.l` | `unboundedRecursion` | Multiple recursive predicates missing annotation |
| `36_partial_mutual_recursion_no_base.l` | `noBaseCase` | One predicate in mutual recursion lacks base |

### Arity Errors (some caught by Python Logica too)

| File | Error | Description |
|------|-------|-------------|
| `09_arity_mismatch_fewer.l` | `arityMismatch` | Called with fewer arguments |
| `10_inconsistent_arity.l` | `arityMismatch` | Same predicate, different arities |
| `31_arity_in_recursion.l` | `arityMismatch` | Arity mismatch in recursive call |

## Running Tests

```bash
cargo test --test verifier_tests
```

## Generating Expected SQL

To verify these are valid Logica syntax that Python compiles:

```bash
python3 generate_expected_sql.py
```

This generates `.sql` files for tests that Python Logica successfully compiles.

## Related: Compiler Fail Tests

Tests for errors that **both** Python Logica and our compiler catch are in
`compiler_tests/{engine}/*_fail.l`. These test that our compiler correctly
rejects invalid programs (matching Python Logica's behavior).
