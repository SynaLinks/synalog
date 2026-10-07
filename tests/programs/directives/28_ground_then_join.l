# A grounded predicate joined with another.
# Expect: rows J = [(1, "a")]
@Ground(G);
G(k:) :- k in [1];
N(k: 1, s: "a");
N(k: 2, s: "b");
J(k:, s:) :- G(k:), N(k:, s:);
