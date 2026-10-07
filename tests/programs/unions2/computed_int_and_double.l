# One rule halves, another doubles.
# Expect: rows Q = [(1, 0.5), (2, 1.0), (3, 1.5), (4, 2.0), (4, 8), (5, 2.5), (5, 10), (6, 3.0), (6, 12), (7, 14), (8, 16)]
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
U(x:, v: x / 2) :- A(x:);
U(x:, v: x * 2) :- B(x:);
@OrderBy(Q, "x", "v");
Q(x:, v:) :- U(x:, v:);
