# Test: The empty list in the first record. (from tests/programs/lists3/record_with_empty_first.l)

R(k: 1, r: {xs: []});
R(k: 2, r: {xs: ["z"]});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
