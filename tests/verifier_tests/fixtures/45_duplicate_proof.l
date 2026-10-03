# Verifier Test: Spec proved twice
# Expected Error: duplicateProof
#
# A spec has one proof. A second `@Proof` of the same name would be silently
# ignored, so it is rejected instead.

@Spec(Ancestor, irreflexive: "∀ x, ¬ Ancestor x x");

Ancestor(x:, y:) :- parent(x:, y:);

@Proof(Ancestor, irreflexive: "intro x h; cases h");
@Proof(Ancestor, irreflexive: "aesop");
