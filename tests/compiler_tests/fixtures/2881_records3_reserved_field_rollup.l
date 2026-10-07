# Test: A record field named rollup, a reserved word on some engine. (from tests/programs/records3/reserved_field_rollup.l)

V(k: 1);
V(k: 2);
R(k:, r: {rollup: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.rollup) :- R(k:, r:);
