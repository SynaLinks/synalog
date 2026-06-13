# Verifier Test: Partial Mutual Recursion Without @Recursive
# Expected Error: RecursionError.unboundedRecursion
#
# A has a base case (Source), so the {A, B} SCC is grounded — base-case-ness
# is a property of the whole SCC, and one member bootstraps it. The real
# defect is that the mutual recursion A <-> B grows unboundedly and carries
# no @Recursive bound, so it is flagged as unbounded recursion, not as a
# missing base case.


Source(x) :- x in Range(10);

# A is grounded by Source; it also recurses through B.
A(x) :- Source(x);
A(x) :- B(y), x == y + 1;

# B recurses through A. The SCC is grounded but unbounded without @Recursive.
B(x) :- A(y), x == y + 1;

Test(x) :- A(x);
