# A record column with a null in row 2, after a join.
# Expect: rows Q = [(1, 'p'), (2, None), (3, 'q')]
V(k: 1, v: {x: 1, y: "p"});
V(k: 2, v: null);
V(k: 3, v: {x: 2, y: "q"});
K(k: 1);
K(k: 2);
K(k: 3);
@OrderBy(Q, "k");
Q(k:, r: v.y) :- K(k:), V(k:, v:);
