# Test: Max over a computed value. (from tests/programs/aggregation/08_max_of_an_expression.l)

V(x:) :- x in [1, -3, 2];
A(m? Max= x * x) distinct :- V(x:);
