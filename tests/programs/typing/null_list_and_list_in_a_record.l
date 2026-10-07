# A record field that is a null list in one row, a list of texts in another.
# Expect: rows Q = [(1, 1), (2, None)]
R(k: 1, r: {xs: ["a"]});
R(k: 2, r: {xs: null});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
