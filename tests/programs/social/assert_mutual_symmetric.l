# Mutual follows are symmetric.
# Expect: holds M.symmetric
Follows(a: "ann", b: "bob");
Follows(a: "bob", b: "ann");
Follows(a: "ann", b: "cat");
Follows(a: "cat", b: "dan");
Follows(a: "dan", b: "cat");
Follows(a: "bob", b: "cat");
Follows(a: "eve", b: "ann");
Follows(a: "eve", b: "bob");
Follows(a: "eve", b: "cat");
Follows(a: "dan", b: "eve");
Follows(a: "fay", b: "cat");
M(a:, b:) :- Follows(a:, b:), Follows(a: b, b: a);
@Assert(M, symmetric: "∀ a b, M a b → M b a");
