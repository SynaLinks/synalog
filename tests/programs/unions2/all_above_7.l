# All values above 7 in A, B and C, repeats kept.
# Expect: rows Q = [(2,)]
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
U(x:) :- A(x:), x > 7;
U(x:) :- B(x:), x > 7;
U(x:) :- C(x:), x > 7;
Q(n? += 1) distinct :- U(x:);
