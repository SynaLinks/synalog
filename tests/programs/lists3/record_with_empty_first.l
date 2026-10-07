# The empty list in the first record.
# Expect: rows Q = [(1, 0), (2, 1)]
R(k: 1, r: {xs: []});
R(k: 2, r: {xs: ["z"]});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
