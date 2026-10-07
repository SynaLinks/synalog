# A float column with a null in row 3, read directly.
# Expect: rows Q = [(1, 2.5), (2, 0.25), (3, None)]
V(k: 1, v: 2.5);
V(k: 2, v: 0.25);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
