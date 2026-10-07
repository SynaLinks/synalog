# A values above 0 and B values below 0.
# Expect: rows Q = [(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1)]
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
U(x:) :- A(x:), x > 0;
U(x:) :- B(x:), x < 0;
@OrderBy(Q, "x");
Q(x:, n? += 1) distinct :- U(x:);
