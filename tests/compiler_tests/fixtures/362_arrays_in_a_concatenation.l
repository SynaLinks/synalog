# Test: Membership in a concatenation. (from tests/programs/arrays/16_in_a_concatenation.l)

@OrderBy(A, "x");
A(x:) :- x in ArrayConcat([1, 2], [3]);
