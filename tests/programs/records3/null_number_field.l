# A null number field.
# Expect: rows Q = [(1, 1), (2, 2), (3, None)]
N(k: 1, r: {a: "x", b: 1});
N(k: 2, r: {a: null, b: 2});
N(k: 3, r: {a: "z", b: null});
@OrderBy(Q, "k");
Q(k:, b: r.b) :- N(k:, r:);
