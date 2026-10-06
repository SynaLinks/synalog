# Test: A record field that is a null list in one row, a list of texts in another. (from tests/programs/typing/null_list_and_list_in_a_record.l)

R(k: 1, r: {xs: ["a"]});
R(k: 2, r: {xs: null});
@OrderBy(Q, "k");
Q(k:, n: Size(r.xs)) :- R(k:, r:);
