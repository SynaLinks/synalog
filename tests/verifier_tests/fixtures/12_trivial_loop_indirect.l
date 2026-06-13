# Verifier Test: Mutual Recursion without Base Case
# Expected Error: noBaseCase
#
# P calls Q calls P with no grounding facts.


Base(x) :- x in Range(10);

# ERROR: P and Q are mutually recursive with no base case
P(x) :- Q(x);
Q(x) :- P(x);

Test(x) :- P(x);
