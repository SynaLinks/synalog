# Boolean literals.
# Expect: rows B = [(1,)]
F(x: 1, ok: true);
F(x: 2, ok: false);
B(x:) :- F(x:, ok: true);
