# An inner ∃ x shadows the outer x.
# Expect: holds V.shadow
@Assert(V, shadow: "∀ x, V x → ∃ x, W x");
V(x:) :- x in [1, 2];
W(x: 9);
