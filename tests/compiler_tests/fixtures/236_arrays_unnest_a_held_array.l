# Test: Iterating over an array held by a fact. (from tests/programs/arrays/09_unnest_a_held_array.l)

F(a: [3, 1]);
@OrderBy(X, "x");
X(x:) :- F(a:), x in a;
