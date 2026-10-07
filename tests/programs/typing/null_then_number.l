# A null first, a number after: the column is a number.
# Expect: rows Q = [(1, None), (2, 5)]
V(k: 1, v: null);
V(k: 2, v: 5);
@OrderBy(Q, "k");
Q(k:, v:) :- V(k:, v:);
