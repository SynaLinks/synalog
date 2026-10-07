# A → B → C reads A → (B → C): only rows in both A and B must be in C.
# Expect: counterexamples V.check = [(2,)]
@Assert(V, check: "∀ x, V x → A x → C x");
V(x:) :- x in [1, 2, 3];
A(x:) :- x in [1, 2];
C(x:) :- x in [1, 3];
