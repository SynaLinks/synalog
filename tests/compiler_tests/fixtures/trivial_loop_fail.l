# Compiler Test: Trivial Loop (should fail)
# Predicate calls itself with identical arguments.


Source(x) :- x in Range(10);
Infinite(x) :- Infinite(x);
Test(x) :- Infinite(x);
