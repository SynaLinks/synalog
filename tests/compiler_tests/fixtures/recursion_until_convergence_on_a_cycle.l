# Test: -1 on a cyclic graph: semi-naive evaluation stops when a step adds nothing. (from tests/programs/recursion/15_until_convergence_on_a_cycle.l)

Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
Edge(a: 3, b: 1);
@Recursive(Reach, -1);
@OrderBy(Reach, "x");
Reach(x: 1) distinct;
Reach(x: b) distinct :- Reach(x: a), Edge(a:, b:);
