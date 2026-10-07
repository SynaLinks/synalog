# Verifier Test: A variable written once inside a negation is a wildcard: refused.
# Expected Error: SafetyError.unsafeNegation
#
# (from tests/programs/logic/negation_local_used_once.l)

N(x:) :- x in [1, 2];
E(a: 1, b: 0);
Q(x:) :- N(x:), ~(E(a: x, b: y), x > 0);
