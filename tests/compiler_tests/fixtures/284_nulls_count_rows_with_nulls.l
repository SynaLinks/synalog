# Test: Counting rows counts those holding nulls. (from tests/programs/nulls/03_count_rows_with_nulls.l)

V(x: 1);
V(x: null);
V(x: 2);
N(n? += 1) distinct :- V(x:);
