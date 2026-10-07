# Followers and followed, per user.
# Expect: rows D = [('ann', 2, 2), ('bob', 2, 2), ('cat', 5, 1), ('dan', 1, 2), ('eve', 1, 3), ('fay', 0, 1)]
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
@OrderBy(D, "u", "followers", "following");
D(u:, followers? += 1, following? += 0) distinct :- Follows(b: u);
D(u:, followers? += 0, following? += 1) distinct :- Follows(a: u);
