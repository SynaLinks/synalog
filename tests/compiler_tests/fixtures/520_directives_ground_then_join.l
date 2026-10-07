# Test: A grounded predicate joined with another. (from tests/programs/directives/28_ground_then_join.l)

@Ground(G);
G(k:) :- k in [1];
N(k: 1, s: "a");
N(k: 2, s: "b");
J(k:, s:) :- G(k:), N(k:, s:);
