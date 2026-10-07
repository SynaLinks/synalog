# Test: A record field named localtime, a reserved word on some engine. (from tests/programs/records3/reserved_field_localtime.l)

V(k: 1);
V(k: 2);
R(k:, r: {localtime: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.localtime) :- R(k:, r:);
