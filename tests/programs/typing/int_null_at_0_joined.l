# A int column with a null in row 1, after a join.
# Expect: rows Q = [(1, None), (2, 4), (3, 7)]
V(k: 1, v: null);
V(k: 2, v: 4);
V(k: 3, v: 7);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
