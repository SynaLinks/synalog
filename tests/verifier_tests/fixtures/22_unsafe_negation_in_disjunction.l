# Verifier Test: Unsafe Negation Inside Disjunction
# Expected Error: SafetyError.unsafeNegation
#
# Variable 'y' appears only inside a negation within a disjunction
# and is not bound by any positive predicate.


A(x) :- x in Range(10);
B(x) :- x in Range(5);

# ERROR: 'y' in negation is not bound positively
Test(x) :- A(x), (~B(y) | x > 5);
