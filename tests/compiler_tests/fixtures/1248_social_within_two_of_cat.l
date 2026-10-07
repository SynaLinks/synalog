# Test: Users cat reaches in one or two follows. (from tests/programs/social/within_two_of_cat.l)

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
@OrderBy(R, "b");
R(b:) distinct :- Follows(a: "cat", b:), b != "cat" | Follows(a: "cat", b: m), Follows(a: m, b:), b != "cat";
