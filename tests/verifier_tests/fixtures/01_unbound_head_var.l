# Verifier Test: Unbound Head Variable
# Expected Error: unboundHeadVar
#
# The variable 'y' appears in the head but is not bound in the body.


Source(a) :- a in Range(10);

# ERROR: 'y' is in the head but never bound in body
Test(a, y) :- Source(a);
