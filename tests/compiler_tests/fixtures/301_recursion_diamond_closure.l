# Test: A closure over a diamond: each pair once. (from tests/programs/recursion/19_diamond_closure.l)

Edge(a: "s", b: "l");
Edge(a: "s", b: "r");
Edge(a: "l", b: "t");
Edge(a: "r", b: "t");
@Recursive(Reach, 10);
Reach(a:, b:) distinct :- Edge(a:, b:);
Reach(a:, b: c) distinct :- Reach(a:, b:), Edge(a: b, b: c);
N(n? += 1) distinct :- Reach();
