# Test: += 1 counts rows, whether a column is null or not. (from tests/programs/nulls/11_count_counts_rows.l)

V(x: null);
V(x: 1);
N(n? += 1) distinct :- V(x:);
