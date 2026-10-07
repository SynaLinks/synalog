# Test: Aggregating the rows a negation keeps. (from tests/programs/negation/13_negation_and_aggregation.l)

V(x:) :- x in [1, 2, 3];
Skip(x: 2);
N(t? += x) distinct :- V(x:), ~Skip(x:);
