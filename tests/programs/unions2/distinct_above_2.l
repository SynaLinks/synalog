# Distinct values above 2 in A, B or C.
# Expect: rows Q = [(7,)]
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
U(x:) distinct :- A(x:), x > 2;
U(x:) distinct :- B(x:), x > 2;
U(x:) distinct :- C(x:), x > 2;
Q(n? += 1) distinct :- U(x:);
