# A suggestion is never someone already followed.
# Expect: holds S.new
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
S(a:, c:) distinct :- Follows(a:, b:), Follows(a: b, b: c), c != a, ~Follows(a:, b: c);
@Assert(S, new: "∀ a c, S a c → ¬ Follows a c");
