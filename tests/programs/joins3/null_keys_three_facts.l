# Three facts with a null key: none meets another.
# Expect: rows Q = []
A(k: null, a: 1);
B(k: null, b: 2);
C(k: null, c: 3);
Q(a:, b:, c:) :- A(k:, a:), B(k:, b:), C(k:, c:);
