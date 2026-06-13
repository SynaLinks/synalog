# Verifier Test: Double Negation Through Intermediate
# Expected Error: StratificationError
#
# P negates Q, Q negates R, R negates P - forms a negative cycle.


Base(x) :- x in Range(10);

# ERROR: P -> ~Q -> ~R -> ~P forms negative cycle
P(x) :- Base(x), ~Q(x);
Q(x) :- Base(x), ~R(x);
R(x) :- Base(x), ~P(x);

Test(x) :- P(x);
