# Test: Not not following: the people dee follows. (from tests/programs/negation3/double_negation_dee.l)

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
NotF(v:) :- U(u: v), ~F(a: "dee", b: v);
@OrderBy(Q, "v");
Q(v:) :- U(u: v), ~NotF(v:);
