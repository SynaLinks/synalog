# A numbers column with a null in row 2, through another predicate.
# Expect: rows Q = [(1, 2), (2, None), (3, 1)]
V(k: 1, v: [1, 2]);
V(k: 2, v: null);
V(k: 3, v: [3]);
W(k:, v:) :- V(k:, v:);
@OrderBy(Q, "k");
Q(k:, r: Size(v)) :- W(k:, v:);
