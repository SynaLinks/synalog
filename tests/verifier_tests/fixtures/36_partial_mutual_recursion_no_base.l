# Verifier Test: Partial Mutual Recursion Missing Base Case
# Expected Error: RecursionError.noBaseCase
#
# A has a base case, but B (which A depends on) doesn't.
# The mutual recursion still lacks termination for B.


Source(x) :- x in Range(10);

# A has a base case
A(x) :- Source(x);
A(x) :- B(y), x == y + 1;

# ERROR: B has no base case - only recursive through A
B(x) :- A(y), x == y + 1;

Test(x) :- A(x);
