# Verifier Test: Assertion whose statement does not parse
# Expected Error: invalidAssertion
#
# The statement stops after the arrow: an implication needs a conclusion.

@Assert(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z →");

Ancestor(x:, y:) :- parent(x:, y:);
