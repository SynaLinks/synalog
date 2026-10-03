# An aggregate over a recursive predicate.
# Expect: rows N = [(6,)]
Edge(x: "a", y: "b");
Edge(x: "b", y: "c");
Edge(x: "c", y: "d");
@Recursive(Reach, 10);
Reach(x:, y:) distinct :- Edge(x:, y:);
Reach(x:, y: z) distinct :- Reach(x:, y:), Edge(x: y, y: z);
N(n? += 1) distinct :- Reach();
