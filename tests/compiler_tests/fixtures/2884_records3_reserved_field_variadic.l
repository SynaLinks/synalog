# Test: A record field named variadic, a reserved word on some engine. (from tests/programs/records3/reserved_field_variadic.l)

V(k: 1);
V(k: 2);
R(k:, r: {variadic: k * 3, other: k}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.variadic) :- R(k:, r:);
