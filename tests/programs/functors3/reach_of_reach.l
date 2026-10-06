# A closure of a closure is the closure.
# Expect: rows Q = [(15,)]
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
Only(a:, b:) :- Link(a:, b:);
R1 := Reach(Edge: Only);
R2 := Reach(Edge: R1);
Q(n? += 1) distinct :- R2(a:, b:);
