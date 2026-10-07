# Test: Summing a field with a null. (from tests/programs/records3/null_field_sum.l)

N(k: 1, r: {a: "x", b: 1});
N(k: 2, r: {a: null, b: 2});
N(k: 3, r: {a: "z", b: null});
Q(t? += r.b) distinct :- N(r:);
