# Membership in a list collected by an aggregate.
# Expect: rows M = [(3,)]
A(x:) :- x in [1, 3];
B(x:) :- x in [3, 5];
L(l? List= x) distinct :- B(x:);
M(x:) :- A(x:), L(l:), x in l;
