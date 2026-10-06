# Test: A list of records, empty in one row. (from tests/programs/records3/list_of_records_empty_in_one_row.l)

T(k: 1, l: [{n: "a"}]);
T(k: 2, l: []);
@OrderBy(Q, "k");
Q(k:, s: Size(l)) :- T(k:, l:);
