# Test: The average of integers is a fraction. (from tests/programs/aggregates/17_avg_of_integers.l)

V(x:) :- x in [1, 2];
A(a? Avg= x) distinct :- V(x:);
