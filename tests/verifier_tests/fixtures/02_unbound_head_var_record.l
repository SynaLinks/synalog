# Verifier Test: Unbound Head Variable in Record
# Expected Error: unboundHeadVar
#
# The variable 'missing' in the record is not bound in the body.


Source(a) :- a in Range(10);

# ERROR: 'missing' is in the head record but never bound
Test(x: a, y: missing) :- Source(a);
