# The null in the first record.
# Expect: rows Q = [(1, None), (2, "y")]
N(k: 1, r: {a: null, b: 1});
N(k: 2, r: {a: "y", b: 2});
@OrderBy(Q, "k");
Q(k:, a: r.a) :- N(k:, r:);
