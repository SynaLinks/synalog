# A null key is not found by a negation either: the row stays.
# Expect: rows Q = [(1,)]
A(k: null, a: 1);
B(k: null);
Q(a:) :- A(k:, a:), ~B(k:);
