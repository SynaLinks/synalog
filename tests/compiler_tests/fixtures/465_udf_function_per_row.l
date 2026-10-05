# Test: A function applied to each row of a predicate. (from tests/programs/udf/13_function_per_row.l)

Next(x) = 2 * x + 1;
V(x:) :- x in [1, 2, 3];
@OrderBy(S, "x");
S(x:, y: Next(x)) :- V(x:);
