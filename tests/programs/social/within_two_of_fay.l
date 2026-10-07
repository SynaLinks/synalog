# Users fay reaches in one or two follows.
# Expect: rows R = [('cat',), ('dan',)]
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
R(b:) distinct :- Follows(a: "fay", b:), b != "fay" | Follows(a: "fay", b: m), Follows(a: m, b:), b != "fay";
