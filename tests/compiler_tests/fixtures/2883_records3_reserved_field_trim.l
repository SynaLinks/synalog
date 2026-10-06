# Test: A record field named trim, a reserved word on some engine. (from tests/programs/records3/reserved_field_trim.l)

V(k: 1);
V(k: 2);
R(k:, r: {trim: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.trim) :- R(k:, r:);
