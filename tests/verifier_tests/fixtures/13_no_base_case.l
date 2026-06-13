# Verifier Test: Recursion without Base Case
# Expected Error: noBaseCase
#
# Recursive predicate has no base case (non-recursive rule).


Edge(1, 2);
Edge(2, 3);

# ERROR: Reachable is recursive but has no base case
Reachable(x, z) :- Reachable(x, y), Edge(y, z);

Test(x, y) :- Reachable(x, y);
