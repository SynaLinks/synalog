# Verifier Test: Spec proved twice
# Expected Error: duplicateProof
#
# A spec has one proof. A second `@Proof` of the same name would be silently
# ignored, so it is rejected instead.

@Spec(Ancestor, grounded: "∀ x y, Ancestor x y → ∃ w, parent x w");

Ancestor(x:, y:) :- parent(x:, y:);

@Proof(Ancestor, grounded: "intro x y h; cases h; exact ⟨_, ‹_›⟩");
@Proof(Ancestor, grounded: "aesop");
