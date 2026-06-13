# Verifier Test: Unsafe Negation with Unbound Variable
# Expected Error: SafetyError.unsafeNegation
#
# Variable 'y' appears in negated predicate but nowhere else.


Numbers(x) :- x in Range(10);
Even(x) :- Numbers(x), x % 2 == 0;

# ERROR: 'y' in ~Even(y) is not bound anywhere positive
Odd(x) :- Numbers(x), ~Even(y);
