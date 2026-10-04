# Test: The average of integers is a float. (from tests/programs/aggregation/02_average_of_integers.l)

V(x:) :- x in [1, 2, 3, 4];
A(m? Avg= x) distinct :- V(x:);
