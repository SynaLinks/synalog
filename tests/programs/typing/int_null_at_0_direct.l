# A int column with a null in row 1, read directly.
# Expect: rows Q = [(1, None), (2, 4), (3, 7)]
V(k: 1, v: null);
V(k: 2, v: 4);
V(k: 3, v: 7);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
