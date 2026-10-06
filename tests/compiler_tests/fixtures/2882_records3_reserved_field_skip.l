# Test: A record field named skip, a reserved word on some engine. (from tests/programs/records3/reserved_field_skip.l)

V(k: 1);
V(k: 2);
R(k:, r: {skip: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.skip) :- R(k:, r:);
