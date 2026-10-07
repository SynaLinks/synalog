# Test: Substr(d, 6, 2) of each date. (from tests/programs/dgrid/part_02.l)

V(d:) :- d in ["2024-03-09", "2023-11-30", "2024-01-15"];
@OrderBy(D, "d");
D(d:, p: Substr(d, 6, 2)) :- V(d:);
