# Test: A null field replaced. (from tests/programs/records3/null_field_coalesced.l)

N(k: 1, r: {a: "x", b: 1});
N(k: 2, r: {a: null, b: 2});
N(k: 3, r: {a: "z", b: null});
@OrderBy(Q, "k");
Q(k:, b: Coalesce(r.b, 0)) :- N(k:, r:);
