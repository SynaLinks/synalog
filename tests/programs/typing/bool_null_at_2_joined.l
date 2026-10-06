# A bool column with a null in row 3, after a join.
# Expect: rows Q = [(1, True), (2, False), (3, None)]
V(k: 1, v: true);
V(k: 2, v: false);
V(k: 3, v: null);
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v) :- K(k:), V(k:, v:);
