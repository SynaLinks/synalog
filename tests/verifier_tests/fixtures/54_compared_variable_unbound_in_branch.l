# Verifier Test: a variable compared in one branch of a disjunction
# Expected Error: SafetyError.unboundComparedVar
#
# The second branch compares x, which nothing binds.

# ERROR: x has no value in the second branch
V(y:) :- y in [1, 2], (y > 1 | x < 0);
