# Test: Records from two rules of one predicate, one with an empty list and a null. (from tests/programs/typing/record_union.l)

R(id: 1, r: {xs: [1, 2], m: 2.0});
R(id: 2, r: {xs: [], m: null});
@OrderBy(Q, "id");
Q(id:, n: Size(r.xs), m: r.m) :- R(id:, r:);
