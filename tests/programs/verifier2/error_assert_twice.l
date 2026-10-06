# Refused: assert twice.
# Expect: error Q.a
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
Q(n:) :- N(n:);
@Assert(Q, a: "∀ n, Q n → n > 0");
@Assert(Q, a: "∀ n, Q n → n > 0");
