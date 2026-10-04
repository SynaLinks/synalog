# A join on two columns.
# Expect: rows J = [(1, 1, "x")]
A(a: 1, b: 1);
A(a: 1, b: 2);
B(a: 1, b: 1, v: "x");
J(a:, b:, v:) :- A(a:, b:), B(a:, b:, v:);
