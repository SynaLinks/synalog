# A shifted by 2 with B.
# Expect: rows Q = [(6,)]
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
U(x: x + 2) distinct :- A(x:);
U(x:) distinct :- B(x:);
Q(n? += 1) distinct :- U(x:);
