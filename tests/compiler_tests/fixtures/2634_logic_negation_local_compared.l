# Test: A variable the negation binds and compares is its own. (from tests/programs/logic/negation_local_compared.l)

N(x:) :- x in [1, 2, 3];
E(a: 1, b: 3);
E(a: 2, b: 9);
@OrderBy(Q, "x");
Q(x:) :- N(x:), ~(E(a: x, b: y), y > 5);
