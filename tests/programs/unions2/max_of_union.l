# The largest of a union.
# Expect: rows Q = [(8,)]
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
Q(m? Max= x) distinct :- U(x:);
