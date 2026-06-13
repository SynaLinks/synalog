# Verifier Test: Nested Negation with Unbound Variable
# Expected Error: SafetyError.unsafeNegation
#
# Variable in nested negation is not bound positively.


Outer(x) :- x in Range(10);
Inner(x, y) :- x in Range(5), y in Range(5);

# ERROR: 'y' in nested negation is not bound positively
Test(x) :- Outer(x), ~Inner(x, y);
