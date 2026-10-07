# Joining on an expression.
# Expect: rows J = [(1, 2)]
A(x: 1);
B(y: 2);
J(x:, y:) :- A(x:), B(y:), y == x + 1;
