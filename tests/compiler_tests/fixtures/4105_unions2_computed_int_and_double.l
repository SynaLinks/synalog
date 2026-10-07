# Test: One rule halves, another doubles. (from tests/programs/unions2/computed_int_and_double.l)

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
