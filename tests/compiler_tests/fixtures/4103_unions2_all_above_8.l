# Test: All values above 8 in A, B and C, repeats kept. (from tests/programs/unions2/all_above_8.l)

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
U(x:) :- A(x:), x > 8;
U(x:) :- B(x:), x > 8;
U(x:) :- C(x:), x > 8;
Q(n? += 1) distinct :- U(x:);
