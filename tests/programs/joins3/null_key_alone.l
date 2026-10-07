# Two nulls are not equal: no row.
# Expect: rows Q = []
A(k: null, a: 1);
B(k: null, b: 2);
Q(a:, b:) :- A(k:, a:), B(k:, b:);
