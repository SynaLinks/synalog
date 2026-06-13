# Verifier Test: Multiple Unbounded Recursive Predicates
# Expected Error: RecursionError.unboundedRecursion
#
# Two recursive predicates, neither has @Recursive annotation.


Edge(a, b) :- a in Range(5), b == a + 1;

# ERROR: Both Path and Reach are recursive without @Recursive
Path(a, b) :- Edge(a, b);
Path(a, c) :- Path(a, b), Edge(b, c);

Reach(a, b) :- Edge(a, b);
Reach(a, c) :- Reach(a, b), Reach(b, c);

Test(a, b) :- Path(a, b), Reach(a, b);
