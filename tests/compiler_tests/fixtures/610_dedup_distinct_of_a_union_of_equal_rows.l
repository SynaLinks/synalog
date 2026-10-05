# Test: distinct over a union of equal rows. (from tests/programs/dedup/07_distinct_of_a_union_of_equal_rows.l)

A(x: 1);
B(x: 1);
D(x:) distinct :- A(x:) | B(x:);
