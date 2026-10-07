# Test: A record field named escape, a reserved word on some engine. (from tests/programs/records3/reserved_field_escape.l)

V(k: 1);
V(k: 2);
R(k:, r: {escape: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.escape) :- R(k:, r:);
