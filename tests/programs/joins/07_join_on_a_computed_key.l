# A join on a computed key.
# Expect: rows J = [(1, 2)]
A(k: 1);
B(k: 2);
B(k: 5);
J(a:, b:) :- A(k: a), B(k: b), b == a + 1;
