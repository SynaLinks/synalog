# Test: @Recursive(P, 2): the base and two more steps. (from tests/programs/recursion/01_depth_bounds_hops.l)

Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
Edge(a: 3, b: 4);
Edge(a: 4, b: 5);
@Recursive(Reach, 2);
@OrderBy(Reach, "x");
Reach(x: 1) distinct;
Reach(x: b) distinct :- Reach(x: a), Edge(a:, b:);
