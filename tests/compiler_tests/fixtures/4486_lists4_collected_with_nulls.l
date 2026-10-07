# Test: A collected list skips no row: a null is collected, and counted. (from tests/programs/lists4/collected_with_nulls.l)

V(x: 1);
V(x: null);
V(x: 2);
C(l? List= x) distinct :- V(x:);
Q(n: Size(l)) :- C(l:);
