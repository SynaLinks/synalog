# A join with a predicate that has no rows has no rows.
# Expect: rows J = []
A(x:) :- x in [1, 2];
B(x:) :- x in [1], x > 5;
@OrderBy(J, "x");
J(x:) :- A(x:), B(x:);
