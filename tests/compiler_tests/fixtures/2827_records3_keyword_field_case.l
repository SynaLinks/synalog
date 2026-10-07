# Test: A field named case. (from tests/programs/records3/keyword_field_case.l)

V(k: 1);
V(k: 2);
R(k:, r: {case: k * 2}) :- V(k:);
@OrderBy(Q, "k");
Q(k:, v: r.case) :- R(k:, r:);
