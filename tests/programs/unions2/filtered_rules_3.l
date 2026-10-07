# A values above 3 and B values below 3.
# Expect: rows Q = [(4, 1), (5, 1), (6, 1)]
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
U(x:) :- A(x:), x > 3;
U(x:) :- B(x:), x < 3;
@OrderBy(Q, "x");
Q(x:, n? += 1) distinct :- U(x:);
