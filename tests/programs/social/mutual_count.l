# How many mutual follows each user has.
# Expect: rows M = [('ann', 1), ('bob', 1), ('cat', 1), ('dan', 1)]
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
@OrderBy(M, "a", "n");
M(a:, n? += 1) distinct :- Follows(a:, b:), Follows(a: b, b: a);
