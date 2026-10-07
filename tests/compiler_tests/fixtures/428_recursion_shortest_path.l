# Test: Shortest distances, an aggregate in the recursion. (from tests/programs/recursion/28_shortest_path.l)

E(a: "a", b: "b");
E(a: "b", b: "c");
E(a: "a", b: "d");
E(a: "d", b: "c");
@Recursive(Dist, 6);
@OrderBy(Dist, "n");
Dist(n: "a", d? Min= 0) distinct;
Dist(n: b, d? Min= d + 1) distinct :- Dist(n: a, d:), E(a:, b:);
