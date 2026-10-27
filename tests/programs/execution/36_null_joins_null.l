# Null equals null in a join.
# Expect: rows J = [(1,), (2,)]
A(k: 1, v: 1);
A(k: null, v: 2);
B(k: 1);
B(k: null);
@OrderBy(J, "v");
J(v:) :- A(k:, v:), B(k:);
