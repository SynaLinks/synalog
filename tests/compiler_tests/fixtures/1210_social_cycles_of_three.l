# Test: Three users following round in a circle, from the first by name. (from tests/programs/social/cycles_of_three.l)

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
T(a:, b:, c:) distinct :- Follows(a:, b:), Follows(a: b, b: c), Follows(a: c, b: a), a < b, a < c;
