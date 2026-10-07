# Test: A variable the negation binds and joins on is its own. (from tests/programs/logic/negation_local_join.l)

N(x:) :- x in [1, 2, 3];
E(a: 1, b: 7);
E(a: 2, b: 8);
L(b: 7);
L(b: 8);
@OrderBy(Q, "x");
Q(x:) :- N(x:), ~(E(a: x, b: y), L(b: y));
