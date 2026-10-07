# A int column with a null in row 2, read directly.
# Expect: rows Q = [(1, 4), (2, None), (3, 7)]
V(k: 1, v: 4);
V(k: 2, v: null);
V(k: 3, v: 7);
@OrderBy(Q, "k");
Q(k:, r: v) :- V(k:, v:);
