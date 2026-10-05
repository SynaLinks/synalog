# Test: A function with Coalesce for a default. (from tests/programs/udf/18_function_with_a_default.l)

OrZero(x) = Coalesce(x, 0);
V(k: 1, x: 1);
V(k: 2, x: null);
@OrderBy(S, "k");
S(k:, v: OrZero(x)) :- V(k:, x:);
