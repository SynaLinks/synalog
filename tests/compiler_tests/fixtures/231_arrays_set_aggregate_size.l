# Test: Set= collects distinct values. (from tests/programs/arrays/04_set_aggregate_size.l)

V(x:) :- x in [1, 1, 2];
L(l? Set= x) distinct :- V(x:);
N(n: Size(l)) :- L(l:);
