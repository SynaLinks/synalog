# Verifier Test: Mixed Positive and Negative Cycle
# Expected Error: StratificationError
#
# A -> B (positive), B -> ~C, C -> A (positive)
# The cycle A -> B -> C -> A contains a negative edge.


Base(x) :- x in Range(10);

A(x) :- Base(x), B(x);
B(x) :- Base(x), ~C(x);
C(x) :- Base(x), A(x);

Test(x) :- A(x);
