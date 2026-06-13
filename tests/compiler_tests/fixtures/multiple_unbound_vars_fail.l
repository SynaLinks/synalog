# Compiler Test: Multiple Unbound Variables (should fail)
# Variables 'y' and 'z' appear in head but not bound in body.


Source(x) :- x in Range(10);
Test(x, y, z) :- Source(x);
