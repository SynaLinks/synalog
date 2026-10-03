# A ∨ B ∧ C reads A ∨ (B ∧ C).
# Expect: counterexamples V.check = [(3,)]
@Assert(V, check: "∀ x, V x → A x ∨ B x ∧ C x");
V(x:) :- x in [1, 2, 3];
A(x:) :- x in [1];
B(x:) :- x in [2, 3];
C(x:) :- x in [2];
