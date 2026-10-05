# Test: A function applied inside an aggregate. (from tests/programs/udf/07_function_in_an_aggregate.l)

Square(x) = x * x;
V(x:) :- x in [1, 2, 3];
T(t? += Square(x)) distinct :- V(x:);
