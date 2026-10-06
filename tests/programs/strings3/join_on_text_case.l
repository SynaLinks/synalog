# A join on text tells cases apart.
# Expect: rows Q = [(1, 10)]
A(k: "x", a: 1);
B(k: "x", b: 10);
B(k: "X", b: 20);
Q(a:, b:) :- A(k:, a:), B(k:, b:);
