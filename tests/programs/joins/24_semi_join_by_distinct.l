# The rows of A that have a match in B, once each.
# Expect: rows J = [(1,)]
A(x: 1);
A(x: 2);
B(x: 1);
B(x: 1);
J(x:) distinct :- A(x:), B(x:);
