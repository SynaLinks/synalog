# distinct over a union of equal rows.
# Expect: rows D = [(1,)]
A(x: 1);
B(x: 1);
D(x:) distinct :- A(x:) | B(x:);
