# Test: A record field that is a null list in one row. (from tests/programs/lists3/record_with_null_list.l)

R(k: 1, r: {xs: ["z"]});
R(k: 2, r: {xs: null});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
