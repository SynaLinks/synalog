# Pairs following nobody in common.
# Expect: rows Q = [('ann', 'cid'), ('ann', 'eve'), ('ann', 'fay'), ('ann', 'gus'), ('bob', 'cid'), ('bob', 'fay'), ('bob', 'gus'), ('cid', 'dee'), ('cid', 'eve'), ('cid', 'fay'), ('cid', 'gus'), ('dee', 'eve'), ('dee', 'fay'), ('dee', 'gus'), ('eve', 'fay'), ('eve', 'gus'), ('fay', 'gus')]
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
@OrderBy(Q, "a", "b");
Q(a:, b:) :- U(u: a), U(u: b), a < b, ~(F(a:, b: x), F(a: b, b: x));
