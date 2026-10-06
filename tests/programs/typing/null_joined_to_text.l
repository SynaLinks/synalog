# A null column joined with a text column on another key.
# Expect: rows Q = [(1, None, 'x')]
A(k: 1, v: null);
B(k: 1, w: "x");
Q(k:, v:, w:) :- A(k:, v:), B(k:, w:);
