# Verifier Test: Complex Negative Cycle
# Expected Error: StratificationError
#
# A depends on B positively, B depends on C negatively,
# C depends on A negatively. This forms a negative cycle.


Base(x) :- x in Range(10);

A(x) :- B(x);
B(x) :- Base(x), ~C(x);
C(x) :- Base(x), ~A(x);

# ERROR: A -> B -> ~C -> ~A forms negative cycle

Test(x) :- A(x);
