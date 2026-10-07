# Test: A record field named describe, a reserved word on some engine. (from tests/programs/records3/reserved_field_describe.l)

V(k: 1);
V(k: 2);
R(k:, r: {describe: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.describe) :- R(k:, r:);
