# A program the verifier accepts: two heads same predicate.
# Expect: valid
# Expect: rows Q = [(1,), (2,), (2,), (3,)]
E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
@OrderBy(Q, "v");
Q(v: a) :- E(a:);
Q(v: b) :- E(b:);
