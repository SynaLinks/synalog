# Records from two rules, one with a null field.
# Expect: rows Q = [(1, "x", 1), (2, None, 0)]
R(k: 1, r: {a: "x", l: [1]});
R(k: 2, r: {a: null, l: []});
@OrderBy(Q, "k");
Q(k:, a: r.a, n: Size(r.l)) :- R(k:, r:);
