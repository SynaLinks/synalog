# Test: A program the verifier accepts: with annotation. (from tests/programs/verifier2/valid_with_annotation.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@With(W);
W(n:) :- N(n:);
Q(c? += 1) distinct :- W(n:);
