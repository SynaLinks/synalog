# Verifier Test: Spec without a name
# Expected Error: malformedSpec
#
# A spec is `@Spec(Predicate, name: "statement")`: the name is what a `@Proof`
# refers to, so a statement passed positionally cannot be proved.

@Spec(Ancestor, "∀ x y, Ancestor x y → ∃ w, parent x w");

Ancestor(x:, y:) :- parent(x:, y:);
