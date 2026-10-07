# Joining after computing a column.
# Expect: rows J = [(1, "two")]
A(x: 1);
D(x:, y: x + 1) :- A(x:);
N(n: 2, s: "two");
J(x:, s:) :- D(x:, y:), N(n: y, s:);
