# Test: A recursive transitive closure. (from tests/programs/execution/09_transitive_closure.l)

Edge(x: "a", y: "b");
Edge(x: "b", y: "c");
Edge(x: "c", y: "d");
@Recursive(Reach, 10);
@OrderBy(Reach, "x", "y");
Reach(x:, y:) distinct :- Edge(x:, y:);
Reach(x:, y: z) distinct :- Reach(x:, y:), Edge(x: y, y: z);
