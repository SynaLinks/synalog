# Test: Count= counts distinct values. (from tests/programs/execution/48_count_distinct_value.l)

V(x:) :- x in [1, 1, 2];
N(n? Count= x) distinct :- V(x:);
