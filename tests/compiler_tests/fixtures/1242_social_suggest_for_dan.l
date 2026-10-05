# Test: People dan's follows follow, that dan does not. (from tests/programs/social/suggest_for_dan.l)

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
@OrderBy(S, "c");
S(c:) distinct :- Follows(a: "dan", b:), Follows(a: b, b: c), c != "dan", ~Follows(a: "dan", b: c);
