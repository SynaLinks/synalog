# The same chain, every third predicate grounded.
# Expect: rows Q = []
@Ground(C0);
@Ground(C3);
@Ground(C6);
@Ground(C9);
C0(x:) :- x in [1, 2, 3, 4, 5, 6, 7, 8];
C1(x:) :- C0(x:), x != 1;
C2(x:) :- C1(x:), x != 2;
C3(x:) :- C2(x:), x != 3;
C4(x:) :- C3(x:), x != 4;
C5(x:) :- C4(x:), x != 5;
C6(x:) :- C5(x:), x != 6;
C7(x:) :- C6(x:), x != 7;
C8(x:) :- C7(x:), x != 8;
C9(x:) :- C8(x:), x != 9;
Q(x:) :- C9(x:);
