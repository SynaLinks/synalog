# Records from two rules.
# Expect: rows Q = [(1, "a", 0), (2, "b", 2)]
R(k: 1, r: {n: "a", l: []});
R(k: 2, r: {n: "b", l: [7, 8]});
@OrderBy(Q, "k");
Q(k:, n: r.n, c: Size(r.l)) :- R(k:, r:);
