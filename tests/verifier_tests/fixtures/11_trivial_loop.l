# Verifier Test: Trivial Loop
# Expected Error: trivialLoop
#
# P calls itself with exact same arguments (trivial infinite loop).


Base(x) :- x in Range(10);

# ERROR: trivial loop - P(x) calls P(x) with same variable
P(x) :- P(x);

Test(x) :- P(x);
