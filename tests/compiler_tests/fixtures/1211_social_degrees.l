# Test: Followers and followed, per user. (from tests/programs/social/degrees.l)

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
