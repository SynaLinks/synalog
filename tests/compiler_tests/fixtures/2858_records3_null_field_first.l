# Test: The null in the first record. (from tests/programs/records3/null_field_first.l)

N(k: 1, r: {a: null, b: 1});
N(k: 2, r: {a: "y", b: 2});
@OrderBy(Q, "k");
Q(k:, a: r.a) :- N(k:, r:);
