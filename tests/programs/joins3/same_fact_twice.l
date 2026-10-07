# The same fact read twice meets itself on a value.
# Expect: rows Q = [(1,)]
A(k: 5, a: 1);
Q(a:) :- A(k:, a:), A(k:);
