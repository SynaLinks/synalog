# People neither following nor followed by gus.
# Expect: rows Q = [('ann',), ('bob',), ('cid',), ('dee',), ('eve',), ('fay',)]
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
@OrderBy(Q, "v");
Q(v:) :- U(u: v), v != "gus", ~F(a: "gus", b: v), ~F(a: v, b: "gus");
