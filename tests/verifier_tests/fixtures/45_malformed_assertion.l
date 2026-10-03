# Verifier Test: Assertion without a name
# Expected Error: malformedAssertion
#
# An assertion is `@Assert(Predicate, name: "statement")`: the name identifies the
# property, so a statement passed positionally cannot be referred to.

@Assert(Ancestor, "∀ x, ¬ Ancestor x x");

Ancestor(x:, y:) :- parent(x:, y:);
