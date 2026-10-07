# Verifier Test: A variable only compared inside a negation has no value.
# Expected Error: SafetyError.unsafeNegation
#
# (from tests/programs/logic/negation_local_unbound.l)

N(x:) :- x in [1, 2];
E(a: 1, b: 0);
Q(x:) :- N(x:), ~(E(a: x), y > 0);
