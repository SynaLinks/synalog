# Verifier Test: Three-Way Negative Cycle
# Expected Error: StratificationError
#
# A -> ~B -> ~C -> ~A forms a negative cycle.


Base(x) :- x in Range(10);

# ERROR: A, B, C form a negative cycle
A(x) :- Base(x), ~C(x);
B(x) :- Base(x), ~A(x);
C(x) :- Base(x), ~B(x);

Test(x) :- A(x);
