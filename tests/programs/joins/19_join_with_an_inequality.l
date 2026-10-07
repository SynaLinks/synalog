# Joining on an inequality.
# Expect: rows J = [(1, 2), (1, 3), (2, 3)]
A(x:) :- x in [1, 2, 3];
@OrderBy(J, "a", "b");
J(a:, b:) :- A(x: a), A(x: b), b > a;
