# People cat's follows follow, that cat does not.
# Expect: rows S = [('eve',)]
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
S(c:) distinct :- Follows(a: "cat", b:), Follows(a: b, b: c), c != "cat", ~Follows(a: "cat", b: c);
