# Test: Negating a comparison with !. (from tests/programs/boolean/01_negated_comparison.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(B, "x");
B(x:) :- V(x:), !(x > 2);
