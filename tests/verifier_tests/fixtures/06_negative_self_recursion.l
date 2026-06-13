# Verifier Test: Negative Self-Recursion
# Expected Error: StratificationError
#
# Predicate P depends negatively on itself.


Base(x) :- x in Range(10);

# ERROR: P depends negatively on itself
P(x) :- Base(x), ~P(x);

Test(x) :- P(x);
