# A and B differ both ways.
# Expect: counterexamples A.same = [(1,), (3,)]
@Assert(A, same: "∀ x, A x ↔ B x");
A(x:) :- x in [1, 2];
B(x:) :- x in [2, 3];
