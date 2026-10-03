# Verifier Test: Spec stated twice
# Expected Error: duplicateSpec
#
# A spec name identifies one statement of a predicate. Stating `ordered` twice
# leaves it ambiguous which statement the name stands for.

@Spec(Ancestor, ordered: "∀ x y, Ancestor x y → x < y");
@Spec(Ancestor, ordered: "∀ x y, Ancestor x y → x ≤ y");

Ancestor(x:, y:) :- parent(x:, y:);
