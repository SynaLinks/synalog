# Verifier Test: Spec without a name
# Expected Error: malformedSpec
#
# A spec is `@Spec(Predicate, name: "statement")`: the name identifies the
# property, so a statement passed positionally cannot be referred to.

@Spec(Ancestor, "∀ x, ¬ Ancestor x x");

Ancestor(x:, y:) :- parent(x:, y:);
