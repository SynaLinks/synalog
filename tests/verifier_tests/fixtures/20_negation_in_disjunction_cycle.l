# Verifier Test: Negative Cycle Through Disjunction
# Expected Error: StratificationError
#
# P depends on Q through a disjunction containing negation of Q.
# This creates a negative cycle that violates stratification.


Base(x) :- x in Range(10);

# ERROR: Negative cycle - P depends negatively on Q inside disjunction
P(x) :- Base(x), (Q(x) | ~Q(x));
Q(x) :- Base(x), ~P(x);

Test(x) :- P(x);
