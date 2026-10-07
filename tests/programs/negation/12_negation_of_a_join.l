# Negating a joined predicate.
# Expect: rows N = [("b",)]
P(n: "a", k: 1);
P(n: "b", k: 2);
Q(k: 1);
PQ(n:) :- P(n:, k:), Q(k:);
N(n:) :- P(n:), ~PQ(n:);
