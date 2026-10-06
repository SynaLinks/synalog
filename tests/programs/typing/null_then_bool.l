# A null first, a bool after: the column is a bool.
# Expect: rows Q = [(1, None), (2, True)]
V(k: 1, v: null);
V(k: 2, v: true);
@OrderBy(Q, "k");
Q(k:, v:) :- V(k:, v:);
