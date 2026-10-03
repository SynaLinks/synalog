# A relation closed under both directions is symmetric.
# Expect: holds Friend.symmetric

@Assert(Friend, symmetric: "∀ x y, Friend x y → Friend y x");
Knows(x: "a", y: "b");
Knows(x: "b", y: "c");
Friend(x:, y:) :- Knows(x:, y:) | Knows(x: y, y: x);
