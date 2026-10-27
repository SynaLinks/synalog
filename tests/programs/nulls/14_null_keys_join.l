# Rows with a null key join rows with a null key.
# Expect: rows J = [(0,), (1,)]
A(k: null, a: 0);
A(k: 1, a: 1);
B(k: null, b: 0);
B(k: 1, b: 1);
@OrderBy(J, "a");
J(a:) :- A(k:, a:), B(k:, b:);
