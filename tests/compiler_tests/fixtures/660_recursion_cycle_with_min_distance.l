# Test: Shortest distances on a graph with a cycle. (from tests/programs/recursion/45_cycle_with_min_distance.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 1);
@Recursive(D, 10);
@OrderBy(D, "n");
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);
