# Verifier Test: Unsafe Negation
# Expected Error: SafetyError.unsafeNegation
#
# The variable 'x' only appears in a negated predicate,
# not in any positive predicate. This makes the negation unsafe.


Source(a) :- a in Range(10);
Other(b) :- b in Range(5);

# ERROR: 'x' only appears negated, not bound positively
Test(a) :- Source(a), ~Other(x);
