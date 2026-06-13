# Verifier Test: Negative Recursion Cycle
# Expected Error: StratificationError
#
# P depends negatively on Q, and Q depends negatively on P.
# This creates an unstratifiable negative cycle.


Base(x) :- x in Range(10);

# ERROR: P and Q form a negative cycle
P(x) :- Base(x), ~Q(x);
Q(x) :- Base(x), ~P(x);

Test(x) :- P(x);
