# A variable the negation binds and joins on is its own.
# Expect: rows Q = [(3,)]
N(x:) :- x in [1, 2, 3];
E(a: 1, b: 7);
E(a: 2, b: 8);
L(b: 7);
L(b: 8);
@OrderBy(Q, "x");
Q(x:) :- N(x:), ~(E(a: x, b: y), L(b: y));
