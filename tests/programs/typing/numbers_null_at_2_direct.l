# A numbers column with a null in row 3, read directly.
# Expect: rows Q = [(1, 2), (2, 1), (3, None)]
V(k: 1, v: [1, 2]);
V(k: 2, v: [3]);
V(k: 3, v: null);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- V(k:, v:);
