# Verifier Test: y gets no value.
# Expected Error: SafetyError.unboundHeadVar
#
# (from tests/programs/verifier/01_unbound_head_variable.l)

Total(x:, y:) :- x in [1, 2];
