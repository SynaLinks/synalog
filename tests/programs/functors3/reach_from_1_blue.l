# Nodes reached from 1 by blue links.
# Expect: rows Q = []
Link(a: 1, b: 2, c: "red");
Link(a: 2, b: 3, c: "red");
Link(a: 3, b: 4, c: "blue");
Link(a: 4, b: 5, c: "red");
Link(a: 2, b: 5, c: "blue");
Link(a: 5, b: 6, c: "blue");
Edge(a: 0, b: 0);
@Recursive(Reach, -1);
Reach(a:, b:) distinct :- Edge(a:, b:);
Reach(a:, b: c) distinct :- Reach(a:, b:), Edge(a: b, b: c);
Only(a:, b:) :- Link(a:, b:, c: "blue");
R := Reach(Edge: Only);
@OrderBy(Q, "b");
Q(b:) :- R(a: 1, b:);
