# A record field that is a null list in one row.
# Expect: rows Q = [(1, 1), (2, None)]
R(k: 1, r: {xs: ["z"]});
R(k: 2, r: {xs: null});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
