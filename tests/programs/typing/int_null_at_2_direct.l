# A int column with a null in row 3, read directly.
# Expect: rows Q = [(1, 4), (2, 7), (3, None)]
V(k: 1, v: 4);
V(k: 2, v: 7);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
