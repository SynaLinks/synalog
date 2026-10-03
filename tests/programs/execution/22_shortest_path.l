# Shortest distances with a Min aggregate over a recursion.
# Expect: rows Dist = [("a", 0), ("b", 1), ("c", 2), ("d", 1)]
Edge(x: "a", y: "b");
Edge(x: "b", y: "c");
Edge(x: "a", y: "d");
Edge(x: "d", y: "c");
@Recursive(Dist, 10);
@OrderBy(Dist, "node");
Dist(node: "a", d? Min= 0) distinct;
Dist(node: y, d? Min= d + 1) distinct :- Dist(node: x, d:), Edge(x:, y:);
