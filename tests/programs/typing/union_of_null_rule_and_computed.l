# A rule of nulls and a rule of computed numbers, in one predicate.
# Expect: rows Q = [(1, None), (2, 0.5)]
U(k: 1, v: null);
U(k: 2, v: 1 / 2);
@OrderBy(Q, "k");
Q(k:, v:) :- U(k:, v:);
