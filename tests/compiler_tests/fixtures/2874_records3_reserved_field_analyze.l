# Test: A record field named analyze, a reserved word on some engine. (from tests/programs/records3/reserved_field_analyze.l)

V(k: 1);
V(k: 2);
R(k:, r: {analyze: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.analyze) :- R(k:, r:);
