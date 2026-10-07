# Test: A field named select. (from tests/programs/records3/keyword_field_select.l)

V(k: 1);
V(k: 2);
R(k:, r: {select: k * 2}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.select) :- R(k:, r:);
