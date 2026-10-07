# Test: A function in a filter. (from tests/programs/functions/06_function_in_a_filter.l)

Square(x) = x * x;
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(R, "x");
R(x:) :- V(x:), Square(x) > 5;
