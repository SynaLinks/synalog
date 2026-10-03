# Test: x is bound before it is negated. (from tests/programs/verifier/03_safe_negation.l)

Item(x:) :- x in [1, 2, 3];
Banned(x: 2);
@OrderBy(Allowed, "x");
Allowed(x:) :- Item(x:), ~Banned(x:);
