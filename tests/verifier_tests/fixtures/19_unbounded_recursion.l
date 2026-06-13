# Verifier Test: Unbounded Recursion (Missing @Recursive)
# Expected Error: RecursionError.unboundedRecursion
#
# Recursive predicates require an @Recursive annotation to set
# a maximum iteration limit. Without it, recursion is unbounded.


Edge(a, b) :- a in Range(5), b == a + 1;

# ERROR: Recursive predicate without @Recursive annotation
# Should have: @Recursive(Reachable, 10);
Reachable(a, b) :- Edge(a, b);
Reachable(a, c) :- Reachable(a, b), Edge(b, c);

Test(a, b) :- Reachable(a, b);
