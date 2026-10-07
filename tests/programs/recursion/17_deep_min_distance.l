# An aggregate in the recursion recomputes every step, until nothing changes.
# Expect: rows Dist = [(0, 0), (1, 1), (2, 1), (3, 2)]
Edge(a: 0, b: 1);
Edge(a: 0, b: 2);
Edge(a: 1, b: 3);
Edge(a: 2, b: 3);
Edge(a: 3, b: 0);
@Recursive(Dist, -1);
@OrderBy(Dist, "node");
Dist(node: 0, d? Min= 0) distinct;
Dist(node: b, d? Min= d + 1) distinct :- Dist(node: a, d:), Edge(a:, b:);
