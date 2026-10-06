# Test: A record field named recursive, a reserved word on some engine. (from tests/programs/records3/reserved_field_recursive.l)

V(k: 1);
V(k: 2);
R(k:, r: {recursive: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.recursive) :- R(k:, r:);
