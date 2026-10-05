# Joining on two columns.
# Expect: rows J = [("x",)]
A(k1: 1, k2: 1, v: "x");
A(k1: 1, k2: 2, v: "y");
B(k1: 1, k2: 1);
J(v:) :- A(k1:, k2:, v:), B(k1:, k2:);
