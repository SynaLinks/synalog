# Test: The alternatives as a predicate of their own, negated. (from tests/programs/verifier/disjunction_as_its_own_predicate.l)

V(x: 1);
V(x: 2);
V(x: 3);
Other(x:) distinct :- V(x:), x == 2 | V(x:), x == 3;
Q(x:) :- V(x:), ~Other(x:);
