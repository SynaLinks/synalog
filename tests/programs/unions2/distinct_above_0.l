# Distinct values above 0 in A, B or C.
# Expect: rows Q = [(9,)]
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
U(x:) distinct :- A(x:), x > 0;
U(x:) distinct :- B(x:), x > 0;
U(x:) distinct :- C(x:), x > 0;
Q(n? += 1) distinct :- U(x:);
