# A null column joined with a bool column on another key.
# Expect: rows Q = [(1, None, True)]
A(k: 1, v: null);
B(k: 1, w: true);
Q(k:, v:, w:) :- A(k:, v:), B(k:, w:);
