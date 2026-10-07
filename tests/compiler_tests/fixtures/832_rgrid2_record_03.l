# Test: A value from the fields of {n: {m: 4}}. (from tests/programs/rgrid2/record_03.l)

V(r: {n: {m: 4}});
R(v: r.n.m * 2) :- V(r:);
