# Verifier Test: Unbound Variable In Negated Subquery
# Expected Error: SafetyError.unsafeNegation
#
# Variable 'y' is used inside a negated combine but not bound positively.


A(x) :- x in Range(10);
B(x, y) :- x in Range(5), y == x * 2;

# ERROR: 'y' in negation is not bound by positive predicate
Test(x) :- A(x), ~B(x, y);
