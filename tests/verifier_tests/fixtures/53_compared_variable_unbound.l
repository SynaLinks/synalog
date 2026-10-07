# Verifier Test: a variable only compared, never bound
# Expected Error: SafetyError.unboundComparedVar
#
# A comparison filters rows; it gives x no value.

# ERROR: x has no value to compare
V(y:) :- y in [1, 2], x > 2;
