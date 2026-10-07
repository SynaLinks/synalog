# Reachability over any edges: apply it with Reach(Edge: YourEdges).
# Expect: valid
Edge(a: "", b: "");
@Recursive(Reach, 8);
Reach(a:, b:) distinct :- Edge(a:, b:);
Reach(a:, b: c) distinct :- Reach(a:, b:), Edge(a: b, b: c);
