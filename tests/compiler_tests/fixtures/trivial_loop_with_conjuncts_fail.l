# Compiler Test: Trivial Loop With Conjuncts (should fail)
# Trivial loop even with other conditions.


Source(x) :- x in Range(10);
BadLoop(x) :- Source(x), BadLoop(x), x > 5;
Test(x) :- BadLoop(x);
