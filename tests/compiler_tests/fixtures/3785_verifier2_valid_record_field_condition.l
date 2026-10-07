# Test: A program the verifier accepts: record field condition. (from tests/programs/verifier2/valid_record_field_condition.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
N(n: 1, s: "x");
N(n: 2, s: "y");
N(n: 3, s: "z");
R(r: {v: a}) :- E(a:);
Q(v: r.v) :- R(r:), r.v > 1;
