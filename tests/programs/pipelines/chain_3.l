# A chain of 3 predicates, each dropping one value.
# Expect: rows Q = [(4,), (5,), (6,), (7,), (8,)]
C0(x:) :- x in [1, 2, 3, 4, 5, 6, 7, 8];
C1(x:) :- C0(x:), x != 1;
C2(x:) :- C1(x:), x != 2;
C3(x:) :- C2(x:), x != 3;
@OrderBy(Q, "x");
Q(x:) :- C3(x:);
