# The sum over a union with duplicates.
# Expect: rows Q = [(51,)]
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
U(x:) :- A(x:);
U(x:) :- B(x:);
Q(s? += x) distinct :- U(x:);
