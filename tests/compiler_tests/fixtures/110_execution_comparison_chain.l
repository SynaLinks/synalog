# Test: Several comparisons in one body. (from tests/programs/execution/27_comparison_chain.l)

V(x:) :- x in [1, 2, 3, 4, 5];
@OrderBy(Mid, "x");
Mid(x:) :- V(x:), x > 2, x <= 4;
