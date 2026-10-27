# Equal keys meet, null ones too.
# Expect: rows Q = [(1, 10), (2, 20)]
A(k: null, a: 1);
A(k: 5, a: 2);
B(k: null, b: 10);
B(k: 5, b: 20);
@OrderBy(Q, "a");
Q(a:, b:) :- A(k:, a:), B(k:, b:);
