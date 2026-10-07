# A record column with a null in row 1, after a join.
# Expect: rows Q = [(1, None), (2, 'p'), (3, 'q')]
V(k: 1, v: null);
V(k: 2, v: {x: 1, y: "p"});
V(k: 3, v: {x: 2, y: "q"});
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v.y) :- K(k:), V(k:, v:);
