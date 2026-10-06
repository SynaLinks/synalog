# The same fact read twice does not meet itself on a null.
# Expect: rows Q = []
A(k: null, a: 1);
Q(a:) :- A(k:, a:), A(k:);
