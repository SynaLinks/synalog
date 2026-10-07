# A program the verifier accepts: head constant.
# Expect: valid
# Expect: rows Q = [('c', 2)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(k: "c", n:) :- N(n:), n == 2;
