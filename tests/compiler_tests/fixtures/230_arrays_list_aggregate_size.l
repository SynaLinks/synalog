# Test: List= collects every value. (from tests/programs/arrays/03_list_aggregate_size.l)

V(x:) :- x in [1, 1, 2];
L(l? List= x) distinct :- V(x:);
N(n: Size(l)) :- L(l:);
