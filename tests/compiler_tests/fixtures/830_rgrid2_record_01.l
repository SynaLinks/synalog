# Test: A value from the fields of {a: 1, b: 2}. (from tests/programs/rgrid2/record_01.l)

V(r: {a: 1, b: 2});
R(v: r.a + r.b) :- V(r:);
