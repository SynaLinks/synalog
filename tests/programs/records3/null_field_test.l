# Testing a field for null.
# Expect: rows Q = [(2,)]
N(k: 1, r: {a: "x", b: 1});
N(k: 2, r: {a: null, b: 2});
N(k: 3, r: {a: "z", b: null});
Q(k:) :- N(k:, r:), r.a is null;
