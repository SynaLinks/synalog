# Test: A function compared in a filter. (from tests/programs/udf/17_function_in_a_filter.l)

Square(x) = x * x;
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(S, "x");
S(x:) :- V(x:), Square(x) > 5;
