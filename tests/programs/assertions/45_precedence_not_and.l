# ¬ binds tighter than ∧: (¬ A x) ∧ B x. 1 is in A, 2 is not in B.
# Expect: counterexamples V.check = [(1,), (2,)]
@Assert(V, check: "∀ x, V x → ¬ A x ∧ B x");
V(x:) :- x in [1, 2, 3];
A(x:) :- x in [1];
B(x:) :- x in [1, 3];
