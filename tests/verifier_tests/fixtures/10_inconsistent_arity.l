# Verifier Test: Inconsistent Arity Across Rules
# Expected Error: TypeError.arityMismatch
#
# Same predicate defined with different arities in different rules.


# ERROR: Multi defined with 2 arguments here
Multi(x, y) :- x in Range(5), y == x * 2;

# ERROR: Multi defined with 3 arguments here
Multi(a, b, c) :- a in Range(3), b == a + 1, c == b + 1;

Test(x, y) :- Multi(x, y);
