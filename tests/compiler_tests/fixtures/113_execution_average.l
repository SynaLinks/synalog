# Test: The Avg aggregate. (from tests/programs/execution/30_average.l)

V(x:) :- x in [1, 2, 3, 4];
Mean(m? Avg= x) distinct :- V(x:);
