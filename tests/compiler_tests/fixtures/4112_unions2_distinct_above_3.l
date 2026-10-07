# Test: Distinct values above 3 in A, B or C. (from tests/programs/unions2/distinct_above_3.l)

A(x: 1);
A(x: 2);
A(x: 3);
A(x: 4);
A(x: 5);
A(x: 6);
B(x: 4);
B(x: 5);
B(x: 6);
B(x: 7);
B(x: 8);
C(x: 2);
C(x: 7);
C(x: 9);
U(x:) distinct :- A(x:), x > 3;
U(x:) distinct :- B(x:), x > 3;
U(x:) distinct :- C(x:), x > 3;
Q(n? += 1) distinct :- U(x:);
