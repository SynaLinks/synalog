# Joining [1, 1] with [1].
# Expect: rows J = [(1,), (1,)]
A(x: 1);
A(x: 1);
B(x: 1);
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
