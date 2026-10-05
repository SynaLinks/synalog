# Test: The minimum of negative fractions. (from tests/programs/aggregates/18_min_of_negative_fractions.l)

V(x:) :- x in [-1.5, -2.5, 0.5];
A(m? Min= x) distinct :- V(x:);
