# The same chain, every third predicate grounded.
# Expect: rows Q = []
@Ground(C0);
@Ground(C3);
@Ground(C6);
@Ground(C9);
@Ground(C12);
@Ground(C15);
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
C10(x:) :- C9(x:), x != 10;
C11(x:) :- C10(x:), x != 11;
C12(x:) :- C11(x:), x != 12;
C13(x:) :- C12(x:), x != 13;
C14(x:) :- C13(x:), x != 14;
C15(x:) :- C14(x:), x != 15;
Q(x:) :- C15(x:);
