# Records with a null field do not meet on it.
# Expect: rows Q = []
A(r: {k: null});
B(r: {k: null});
Q(x: 1) :- A(r: a), B(r: b), a.k == b.k;
