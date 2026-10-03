# Verifier Test: Proof with no matching spec
# Expected Error: orphanProof
#
# A `@Proof` carries no statement of its own: the property it proves is the one
# a `@Spec` of the same predicate states under the same name. Here the proof is
# named `transitive` while the only spec is `grounded`, so nothing says what
# `transitive` claims and the proof justifies nothing.

@Spec(Ancestor, grounded: "∀ x y, Ancestor x y → ∃ w, parent x w");

@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), parent(x: y, y: z);

@Proof(Ancestor, transitive: "intro x y z h1 h2; induction h2 <;> aesop");
