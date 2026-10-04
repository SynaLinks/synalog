# Test: A function inside an aggregate. (from tests/programs/functions/05_function_in_an_aggregate.l)

Square(x) = x * x;
V(x:) :- x in [1, 2, 3];
R(t? += Square(x)) distinct :- V(x:);
