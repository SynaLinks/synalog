# Not everyone has a follower.
# Expect: violated User.followed 1
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
User(u:) distinct :- Follows(a: u) | Follows(b: u);
@Assert(User, followed: "∀ u, User u → ∃ a, Follows a u");
