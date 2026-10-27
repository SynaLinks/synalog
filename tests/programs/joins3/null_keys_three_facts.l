# Three facts with a null key: all three meet.
# Expect: rows Q = [(1, 2, 3)]
A(k: null, a: 1);
B(k: null, b: 2);
C(k: null, c: 3);
Q(a:, b:, c:) :- A(k:, a:), B(k:, b:), C(k:, c:);
