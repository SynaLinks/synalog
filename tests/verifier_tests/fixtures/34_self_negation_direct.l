# Verifier Test: Direct Self-Negation
# Expected Error: StratificationError
#
# Predicate directly negates itself: P(x) :- Base(x), ~P(x)


Base(x) :- x in Range(10);

# ERROR: P directly depends negatively on itself
P(x) :- Base(x), ~P(x);

Test(x) :- P(x);
