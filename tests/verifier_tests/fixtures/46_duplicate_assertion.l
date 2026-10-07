# Verifier Test: Assertion stated twice
# Expected Error: duplicateAssertion
#
# An assertion name identifies one statement of a predicate. Stating `ordered` twice
# leaves it ambiguous which statement the name stands for.

@Assert(Ancestor, ordered: "∀ x y, Ancestor x y → x < y");
@Assert(Ancestor, ordered: "∀ x y, Ancestor x y → x ≤ y");

Ancestor(x:, y:) :- parent(x:, y:);
