# Test: A comparison as text. (from tests/programs/strings/31_tostring_of_a_comparison.l)

V(x:) :- x in [1, 3];
@OrderBy(S, "x");
S(x:, t: ToString(x > 2)) :- V(x:);
