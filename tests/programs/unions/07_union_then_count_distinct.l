# Counting the distinct values of a union.
# Expect: rows C = [(3,)]
U(x:) :- x in [1, 2];
U(x:) :- x in [2, 3];
D(x:) distinct :- U(x:);
C(n? += 1) distinct :- D(x:);
