# Test: A record field that is an empty list in one row. (from tests/programs/lists3/record_with_empty_numbers.l)

R(k: 1, r: {xs: [1, 2]});
R(k: 2, r: {xs: []});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
