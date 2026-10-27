# Two nulls are equal: they meet.
# Expect: rows Q = [(1, 2)]
A(k: null, a: 1);
B(k: null, b: 2);
Q(a:, b:) :- A(k:, a:), B(k:, b:);
