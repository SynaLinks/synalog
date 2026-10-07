# A set keeps each value once.
# Expect: rows Q = [(2,)]
V(x: 1);
V(x: 1);
V(x: 2);
C(l? Set= x) distinct :- V(x:);
Q(n: Size(l)) :- C(l:);
