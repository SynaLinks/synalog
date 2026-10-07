# Joining [1, 2, 3] with [2, 3, 4].
# Expect: rows J = [(2,), (3,)]
A(x: 1);
A(x: 2);
A(x: 3);
B(x: 2);
B(x: 3);
B(x: 4);
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
