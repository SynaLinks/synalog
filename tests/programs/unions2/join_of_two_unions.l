# Two unions joined.
# Expect: rows Q = [(17,)]
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
V(y:) :- A(x: y);
V(y:) :- B(x: y);
Q(n? += 1) distinct :- U(x:), V(y: x);
