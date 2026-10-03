# Verifier Test: P negates itself: never stratified.
# Expected Error: StratificationError
#
# (from tests/programs/verifier/35_predicate_in_its_own_negation.l)

@Recursive(P, 3);
Node(x:) :- x in [1];
P(x:) :- Node(x:), ~P(x:);
