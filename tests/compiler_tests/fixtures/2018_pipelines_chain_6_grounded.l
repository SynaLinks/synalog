# Test: The same chain, every third predicate grounded. (from tests/programs/pipelines/chain_6_grounded.l)

@Ground(C0);
@Ground(C3);
@Ground(C6);
C0(x:) :- x in [1, 2, 3, 4, 5, 6, 7, 8];
C1(x:) :- C0(x:), x != 1;
C2(x:) :- C1(x:), x != 2;
C3(x:) :- C2(x:), x != 3;
C4(x:) :- C3(x:), x != 4;
C5(x:) :- C4(x:), x != 5;
C6(x:) :- C5(x:), x != 6;
@OrderBy(Q, "x");
Q(x:) :- C6(x:);
