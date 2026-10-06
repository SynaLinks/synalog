# A null field replaced.
# Expect: rows Q = [(1, 1), (2, 2), (3, 0)]
N(k: 1, r: {a: "x", b: 1});
N(k: 2, r: {a: null, b: 2});
N(k: 3, r: {a: "z", b: null});
@OrderBy(Q, "k");
Q(k:, b: Coalesce(r.b, 0)) :- N(k:, r:);
