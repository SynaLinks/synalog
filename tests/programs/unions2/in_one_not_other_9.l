# Values above 9 in A or B, but not both.
# Expect: rows Q = []
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
U(x:) distinct :- A(x:);
U(x:) distinct :- B(x:);
Both(x:) :- A(x:), B(x:);
@OrderBy(Q, "x");
Q(x:) :- U(x:), x > 9, ~Both(x:);
