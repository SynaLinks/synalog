# Null keys in columns of several rows meet.
# Expect: rows Q = [(1, 10), (2, 20), (3, 10)]
A(k: null, a: 1);
A(k: 5, a: 2);
A(k: null, a: 3);
B(k: null, b: 10);
B(k: 5, b: 20);
@OrderBy(Q, "a");
Q(a:, b:) :- A(k:, a:), B(k:, b:);
