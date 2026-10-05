# The same chain, every third predicate grounded.
# Expect: rows Q = [(4,), (5,), (6,), (7,), (8,)]
@Ground(C0);
@Ground(C3);
C0(x:) :- x in [1, 2, 3, 4, 5, 6, 7, 8];
C1(x:) :- C0(x:), x != 1;
C2(x:) :- C1(x:), x != 2;
C3(x:) :- C2(x:), x != 3;
@OrderBy(Q, "x");
Q(x:) :- C3(x:);
