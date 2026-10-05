# Test: The size of a collected set: no duplicates. (from tests/programs/aggregates/05_set_size.l)

V(x: 1);
V(x: 1);
V(x: 2);
L(l? Set= x) distinct :- V(x:);
A(n: Size(l)) :- L(l:);
