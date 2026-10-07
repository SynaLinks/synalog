# People ann's follows follow, that ann does not.
# Expect: rows S = [('dan',)]
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
S(c:) distinct :- Follows(a: "ann", b:), Follows(a: b, b: c), c != "ann", ~Follows(a: "ann", b: c);
