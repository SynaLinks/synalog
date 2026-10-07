# Test: A combine expression sums a predicate. (from tests/programs/combine/01_sum_of_a_predicate.l)

V(x:) :- x in [1, 2, 3];
T(t:) :- t == (combine += x :- V(x:));
