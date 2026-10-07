# Test: A set keeps each value once. (from tests/programs/lists4/set_of_duplicates.l)

V(x: 1);
V(x: 1);
V(x: 2);
C(l? Set= x) distinct :- V(x:);
Q(n: Size(l)) :- C(l:);
