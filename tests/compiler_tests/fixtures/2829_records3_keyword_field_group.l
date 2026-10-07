# Test: A field named group. (from tests/programs/records3/keyword_field_group.l)

V(k: 1);
V(k: 2);
R(k:, r: {group: k * 2}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.group) :- R(k:, r:);
