# A record field that is an empty list in one row.
# Expect: rows Q = [(1, 2), (2, 0)]
R(k: 1, r: {xs: [1, 2]});
R(k: 2, r: {xs: []});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
