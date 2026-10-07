# Test: Min and max of a computed value. (from tests/programs/aggregates/27_min_and_max_of_an_expression.l)

V(x:) :- x in [-3, 1, 3];
A(lo? Min= x, hi? Max= -x * -1) distinct :- V(x:);
