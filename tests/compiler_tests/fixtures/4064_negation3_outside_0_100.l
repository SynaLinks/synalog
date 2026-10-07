# Test: People not aged between 0 and 100. (from tests/programs/negation3/outside_0_100.l)

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
In(u:) :- U(u:, age:), age >= 0, age <= 100;
@OrderBy(Q, "u");
Q(u:) :- U(u:), ~In(u:);
