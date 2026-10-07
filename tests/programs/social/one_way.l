# Follows that are not returned.
# Expect: rows O = [('ann', 'cat'), ('bob', 'cat'), ('dan', 'eve'), ('eve', 'ann'), ('eve', 'bob'), ('eve', 'cat'), ('fay', 'cat')]
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
@OrderBy(O, "a", "b");
O(a:, b:) :- Follows(a:, b:), ~Follows(a: b, b: a);
