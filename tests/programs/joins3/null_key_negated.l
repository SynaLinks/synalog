# A null key is found by a negation too: the row goes.
# Expect: rows Q = []
A(k: null, a: 1);
B(k: null);
Q(a:) :- A(k:, a:), ~B(k:);
