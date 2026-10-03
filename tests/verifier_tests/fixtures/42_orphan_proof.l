# Verifier Test: Proof with no matching spec
# Expected Error: orphanProof
#
# A `@Proof` carries no statement of its own: the property it proves is the one
# a `@Spec` of the same predicate states under the same name. Here the proof is
# named `transitive` while the only spec is `irreflexive`, so nothing says what
# `transitive` claims and the proof justifies nothing.

@Spec(Ancestor, irreflexive: "∀ x, ¬ Ancestor x x");

Parent(x:, y:) :- parent(x:, y:);

@Recursive(Ancestor, 20);
Ancestor(x:, y:) :- Parent(x:, y:);
Ancestor(x:, y: z) :- Ancestor(x:, y:), Parent(x: y, y: z);

@Proof(Ancestor, transitive: "intro x y z h1 h2; induction h2 <;> aesop");
