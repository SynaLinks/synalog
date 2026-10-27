# Records with a null field meet on it.
# Expect: rows Q = [(1,)]
A(r: {k: null});
B(r: {k: null});
Q(x: 1) :- A(r: a), B(r: b), a.k == b.k;
