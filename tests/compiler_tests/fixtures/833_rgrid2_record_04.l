# Test: A value from the fields of {a: 1.5}. (from tests/programs/rgrid2/record_04.l)

V(r: {a: 1.5});
R(v: r.a * 2) :- V(r:);
