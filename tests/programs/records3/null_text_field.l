# A null text field.
# Expect: rows Q = [(1, "x"), (2, None), (3, "z")]
N(k: 1, r: {a: "x", b: 1});
N(k: 2, r: {a: null, b: 2});
N(k: 3, r: {a: "z", b: null});
@OrderBy(Q, "k");
Q(k:, a: r.a) :- N(k:, r:);
