# Verifier Test: x is bound in one branch of the disjunction only.
# Expected Error: SafetyError.unboundHeadVar
#
# (from tests/programs/verifier/23_unbound_in_one_branch.l)

A(x:) :- x in [1];
B(y:) :- y in [2];
P(x:) :- A(x:) | B(y: x2);
