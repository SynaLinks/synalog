# Test: A program the verifier accepts: head constant. (from tests/programs/verifier2/valid_head_constant.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(k: "c", n:) :- N(n:), n == 2;
