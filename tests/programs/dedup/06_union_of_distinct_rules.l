# Each rule distinct, the union not.
# Expect: rows C = [(2,)]
V(x: 1);
V(x: 1);
A(x:) distinct :- V(x:);
B(x:) distinct :- V(x:);
U(x:) :- A(x:) | B(x:);
C(n? += 1) distinct :- U(x:);
