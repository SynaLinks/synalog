# Verifier Test: Spec whose statement does not parse
# Expected Error: invalidSpec
#
# The statement stops after the arrow: an implication needs a conclusion.

@Spec(Ancestor, transitive: "∀ x y z, Ancestor x y → Ancestor y z →");

Ancestor(x:, y:) :- parent(x:, y:);
