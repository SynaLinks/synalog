# Test: A record field named cube, a reserved word on some engine. (from tests/programs/records3/reserved_field_cube.l)

V(k: 1);
V(k: 2);
R(k:, r: {cube: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.cube) :- R(k:, r:);
