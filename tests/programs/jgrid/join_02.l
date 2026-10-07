# Joining [1] with [2].
# Expect: rows J = []
A(x: 1);
B(x: 2);
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
