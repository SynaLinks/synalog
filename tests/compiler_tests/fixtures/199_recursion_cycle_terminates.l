# Test: A cycle in the data: the depth bounds the work, distinct the rows. (from tests/programs/recursion/11_cycle_terminates.l)

Edge(a: 1, b: 2);
Edge(a: 2, b: 3);
Edge(a: 3, b: 1);
@Recursive(Reach, 30);
@OrderBy(Reach, "x");
Reach(x: 1) distinct;
Reach(x: b) distinct :- Reach(x: a), Edge(a:, b:);
