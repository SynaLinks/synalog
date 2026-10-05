# Users ann reaches in one or two follows.
# Expect: rows R = [('bob',), ('cat',), ('dan',)]
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
R(b:) distinct :- Follows(a: "ann", b:), b != "ann" | Follows(a: "ann", b: m), Follows(a: m, b:), b != "ann";
