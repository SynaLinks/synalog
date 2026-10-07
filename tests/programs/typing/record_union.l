# Records from two rules of one predicate, one with an empty list and a null.
# Expect: rows Q = [(1, 2, 2.0), (2, 0, None)]
R(id: 1, r: {xs: [1, 2], m: 2.0});
R(id: 2, r: {xs: [], m: null});
@OrderBy(Q, "id");
Q(id:, n: Size(r.xs), m: r.m) :- R(id:, r:);
