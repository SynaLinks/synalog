# Test: Users with at least 3 followers. (from tests/programs/social/followed_by_3.l)

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
In(u:, n? += 1) distinct :- Follows(b: u);
I(u:) :- In(u:, n:), n >= 3;
