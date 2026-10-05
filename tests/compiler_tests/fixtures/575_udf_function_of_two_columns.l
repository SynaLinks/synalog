# Test: A function of two columns. (from tests/programs/udf/15_function_of_two_columns.l)

SumSq(a, b) = a * a + b * b;
V(a: 1, b: 2);
V(a: 3, b: 4);
@OrderBy(S, "a");
S(a:, b:, s: SumSq(a, b)) :- V(a:, b:);
