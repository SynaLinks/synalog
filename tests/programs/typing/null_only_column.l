# A column of nulls only.
# Expect: rows Q = [(1, None), (2, None)]
V(k: 1, v: null);
V(k: 2, v: null);
@OrderBy(Q, "k");
Q(k:, v:) :- V(k:, v:);
