# Test: Shortest distances through a deep recursion and Min. (from tests/programs/recursion/09_deep_shortest_path.l)

Edge(a: 0, b: 1);
Edge(a: 0, b: 2);
Edge(a: 1, b: 3);
Edge(a: 2, b: 3);
@Recursive(Hop, 25);
Hop(node: 0, d: 0) distinct;
Hop(node: b, d: d + 1) distinct :- Hop(node: a, d:), Edge(a:, b:), d < 5;
@OrderBy(Dist, "node");
Dist(node:, d? Min= d) distinct :- Hop(node:, d:);
