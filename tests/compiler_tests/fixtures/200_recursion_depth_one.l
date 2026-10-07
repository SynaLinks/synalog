# Test: Depth 1: one step after the base. (from tests/programs/recursion/12_depth_one.l)

Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
@Recursive(Reach, 1);
@OrderBy(Reach, "x");
Reach(x: 1) distinct;
Reach(x: b) distinct :- Reach(x: a), Edge(a:, b:);
