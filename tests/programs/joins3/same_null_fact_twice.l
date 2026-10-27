# The same fact read twice meets itself on a null.
# Expect: rows Q = [(1,)]
A(k: null, a: 1);
Q(a:) :- A(k:, a:), A(k:);
