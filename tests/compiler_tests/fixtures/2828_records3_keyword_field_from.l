# Test: A field named from. (from tests/programs/records3/keyword_field_from.l)

V(k: 1);
V(k: 2);
R(k:, r: {from: k * 2}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.from) :- R(k:, r:);
