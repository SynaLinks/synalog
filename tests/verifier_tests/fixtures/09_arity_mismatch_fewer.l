# Verifier Test: Arity Mismatch (Fewer Arguments)
# Expected Error: TypeError.arityMismatch
#
# Predicate Data is defined with 3 arguments but called with 2.


# Data defined with 3 arguments
Data(x, y, z) :- x in Range(5), y == x * 2, z == x + y;

# ERROR: Data called with only 2 arguments
Test(a, b) :- Data(a, b);
