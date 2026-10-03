# Verifier Test: x only appears negated.
# Expected Error: SafetyError.unboundHeadVar
#
# (from tests/programs/verifier/02_unsafe_negation.l)

Banned(x: 1);
Allowed(x:) :- ~Banned(x:);
