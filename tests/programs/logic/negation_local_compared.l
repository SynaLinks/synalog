# A variable the negation binds and compares is its own.
# Expect: rows Q = [(1,), (3,)]
N(x:) :- x in [1, 2, 3];
E(a: 1, b: 3);
E(a: 2, b: 9);
@OrderBy(Q, "x");
Q(x:) :- N(x:), ~(E(a: x, b: y), y > 5);
