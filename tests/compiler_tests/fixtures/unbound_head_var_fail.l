# Compiler Test: Unbound Head Variable (should fail)
# This test should fail compilation - variable 'y' not bound in body.


Source(x) :- x in Range(10);
Test(x, y) :- Source(x);
