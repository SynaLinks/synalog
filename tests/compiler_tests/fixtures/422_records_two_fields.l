# Test: Reading both fields of a record. (from tests/programs/records/06_two_fields.l)

V(r: {n: 1, s: "a"});
R(n: r.n, s: r.s) :- V(r:);
