# Test: Shortest distances with a Min aggregate over a recursion. (from tests/programs/execution/22_shortest_path.l)

Edge(x: "a", y: "b");
Edge(x: "b", y: "c");
Edge(x: "a", y: "d");
Edge(x: "d", y: "c");
@Recursive(Dist, 10);
@OrderBy(Dist, "node");
Dist(node: "a", d? Min= 0) distinct;
Dist(node: y, d? Min= d + 1) distinct :- Dist(node: x, d:), Edge(x:, y:);
