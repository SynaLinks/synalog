# Verifier Test: Spec stated twice
# Expected Error: duplicateSpec
#
# A spec name identifies one statement of a predicate. Stating `grounded` twice
# leaves it ambiguous which statement a proof of `grounded` justifies.

@Spec(Ancestor, grounded: "∀ x y, Ancestor x y → ∃ w, parent x w");
@Spec(Ancestor, grounded: "∀ x y, Ancestor x y → ∃ w, parent w y");

Ancestor(x:, y:) :- parent(x:, y:);
