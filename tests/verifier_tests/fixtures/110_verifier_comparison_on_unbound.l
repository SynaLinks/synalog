# Verifier Test: x is only compared, never bound.
# Expected Error: SafetyError.unboundComparedVar
#
# (from tests/programs/verifier/31_comparison_on_unbound.l)

V(y:) :- y in [1], x > 2;
