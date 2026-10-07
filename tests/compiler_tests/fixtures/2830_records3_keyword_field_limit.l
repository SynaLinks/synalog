# Test: A field named limit. (from tests/programs/records3/keyword_field_limit.l)

V(k: 1);
V(k: 2);
R(k:, r: {limit: k * 2}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.limit) :- R(k:, r:);
