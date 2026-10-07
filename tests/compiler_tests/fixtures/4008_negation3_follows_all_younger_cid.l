# Test: Whether cid follows everyone younger. (from tests/programs/negation3/follows_all_younger_cid.l)

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
Q(x: 1) :- U(u: "cid", age: me), ~(U(u: v, age: a), a < me, ~F(a: "cid", b: v));
