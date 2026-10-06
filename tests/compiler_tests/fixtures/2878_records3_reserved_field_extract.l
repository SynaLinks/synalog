# Test: A record field named extract, a reserved word on some engine. (from tests/programs/records3/reserved_field_extract.l)

V(k: 1);
V(k: 2);
R(k:, r: {extract: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.extract) :- R(k:, r:);
