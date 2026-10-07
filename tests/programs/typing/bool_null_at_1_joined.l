# A bool column with a null in row 2, after a join.
# Expect: rows Q = [(1, True), (2, None), (3, False)]
V(k: 1, v: true);
V(k: 2, v: null);
V(k: 3, v: false);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
