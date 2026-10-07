# Test: Negating a joined predicate. (from tests/programs/negation/12_negation_of_a_join.l)

P(n: "a", k: 1);
P(n: "b", k: 2);
Q(k: 1);
PQ(n:) :- P(n:, k:), Q(k:);
N(n:) :- P(n:), ~PQ(n:);
