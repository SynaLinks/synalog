# Test: Substr(d, 1, 7) ++ "-01" of each date. (from tests/programs/dgrid/part_04.l)

V(d:) :- d in ["2024-03-09", "2023-11-30", "2024-01-15"];
@OrderBy(D, "d");
D(d:, p: Substr(d, 1, 7) ++ "-01") :- V(d:);
