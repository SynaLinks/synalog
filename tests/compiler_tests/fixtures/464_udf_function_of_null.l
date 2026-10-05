# Test: A function of a null value is null. (from tests/programs/udf/12_function_of_null.l)

Square(x) = x * x;
V(k: 1, x: null);
V(k: 2, x: 2);
@OrderBy(S, "k");
S(k:, v: Coalesce(Square(x), -1)) :- V(k:, x:);
