# Test: How many each person cannot reach. (from tests/programs/negation3/negation_after_recursion_count.l)

U(u: "ann", age: 31);
U(u: "bob", age: 25);
U(u: "cid", age: 40);
U(u: "dee", age: 19);
U(u: "eve", age: 52);
U(u: "fay", age: 28);
U(u: "gus", age: 35);
F(a: "ann", b: "bob");
F(a: "bob", b: "ann");
F(a: "bob", b: "cid");
F(a: "cid", b: "dee");
F(a: "dee", b: "cid");
F(a: "eve", b: "ann");
F(a: "fay", b: "fay");
F(a: "ann", b: "cid");
@Recursive(R, -1);
R(u: a, v: b) distinct :- F(a:, b:);
R(u:, v: c) distinct :- R(u:, v: b), F(a: b, b: c);
@OrderBy(Q, "u");
Q(u:, n? += 1) distinct :- U(u:), U(u: v), ~R(u:, v:);
