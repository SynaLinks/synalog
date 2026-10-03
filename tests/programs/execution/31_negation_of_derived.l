# Negation of a derived, recursive predicate.
# Expect: rows Unreachable = [("e",)]
Node(n:) :- n in ["a", "b", "c", "e"];
Edge(x: "a", y: "b");
Edge(x: "b", y: "c");
@Recursive(Reach, 10);
Reach(x: "a", y: "a") distinct;
Reach(x:, y: z) distinct :- Reach(x:, y:), Edge(x: y, y: z);
@OrderBy(Unreachable, "n");
Unreachable(n:) :- Node(n:), ~Reach(x: "a", y: n);
