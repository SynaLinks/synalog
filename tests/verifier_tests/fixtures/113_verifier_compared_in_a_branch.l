# Verifier Test: x is compared in one branch of a disjunction and bound by nothing.
# Expected Error: SafetyError.unboundComparedVar
#
# (from tests/programs/verifier/37_compared_in_a_branch.l)

V(y:) :- y in [1, 2], (y > 1 | x < 0);
