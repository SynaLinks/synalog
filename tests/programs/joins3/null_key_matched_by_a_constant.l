# A null key is not equal to a constant.
# Expect: rows Q = []
A(k: null, a: 1);
Q(a:) :- A(k: 5, a:);
