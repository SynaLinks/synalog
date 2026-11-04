# A variable holding null is not equal to itself, as null keys do not join:
# x == x keeps the rows whose x is not null.
# Expect: rows Q = [(1,)]
A(x: null);
A(x: 1);
Q(x:) :- A(x:), x == x;
