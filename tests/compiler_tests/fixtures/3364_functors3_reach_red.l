# Test: Pairs connected by red links, by a generic closure. (from tests/programs/functors3/reach_red.l)

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
Only(a:, b:) :- Link(a:, b:, c: "red");
R := Reach(Edge: Only);
Q(n? += 1) distinct :- R(a:, b:);
