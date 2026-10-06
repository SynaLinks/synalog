# Test: A null text field. (from tests/programs/records3/null_text_field.l)

N(k: 1, r: {a: "x", b: 1});
N(k: 2, r: {a: null, b: 2});
N(k: 3, r: {a: "z", b: null});
@OrderBy(Q, "k");
Q(k:, a: r.a) :- N(k:, r:);
