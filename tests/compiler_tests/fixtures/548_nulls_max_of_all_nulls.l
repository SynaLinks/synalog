# Test: Max= of only nulls is null. (from tests/programs/nulls/19_max_of_all_nulls.l)

V(x: null);
V(x: null);
N(m? Max= x) distinct :- V(x:);
