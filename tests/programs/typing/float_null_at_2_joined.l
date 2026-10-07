# A float column with a null in row 3, after a join.
# Expect: rows Q = [(1, 2.5), (2, 0.25), (3, None)]
V(k: 1, v: 2.5);
V(k: 2, v: 0.25);
V(k: 3, v: null);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
