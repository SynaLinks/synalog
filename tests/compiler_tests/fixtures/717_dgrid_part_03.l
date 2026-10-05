# Test: ToInt64(Substr(d, 9, 2)) of each date. (from tests/programs/dgrid/part_03.l)

V(d:) :- d in ["2024-03-09", "2023-11-30", "2024-01-15"];
@OrderBy(D, "d");
D(d:, p: ToInt64(Substr(d, 9, 2))) :- V(d:);
