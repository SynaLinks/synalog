# A collected list skips no row: a null is collected, and counted.
# Expect: rows Q = [(3,)]
V(x: 1);
V(x: null);
V(x: 2);
C(l? List= x) distinct :- V(x:);
Q(n: Size(l)) :- C(l:);
