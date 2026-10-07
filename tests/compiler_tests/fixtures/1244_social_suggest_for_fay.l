# Test: People fay's follows follow, that fay does not. (from tests/programs/social/suggest_for_fay.l)

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
S(c:) distinct :- Follows(a: "fay", b:), Follows(a: b, b: c), c != "fay", ~Follows(a: "fay", b: c);
