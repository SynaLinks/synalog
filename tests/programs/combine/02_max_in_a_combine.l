# The largest value, by a combine expression.
# Expect: rows T = [(9,)]
V(x:) :- x in [4, 9, 2];
T(m:) :- m == (combine Max= x :- V(x:));
