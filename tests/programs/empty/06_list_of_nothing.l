# A list collected from no rows, without a group, is null or empty.
# Expect: rows L = [(0,)]
V(x:) :- x in [1], x > 5;
C(l? List= x) distinct :- V(x:);
L(n: Coalesce(Size(l), 0)) :- C(l:);
