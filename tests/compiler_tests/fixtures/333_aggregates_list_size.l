# Test: The size of a collected list, duplicates included. (from tests/programs/aggregates/04_list_size.l)

V(x: 1);
V(x: 1);
V(x: 2);
L(l? List= x) distinct :- V(x:);
A(n: Size(l)) :- L(l:);
