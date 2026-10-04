# Test: One predicate filtered two ways. (from tests/programs/unions/02_same_predicate_two_filters.l)

V(x:) :- x in [1, 2, 3, 4];
@OrderBy(U, "x");
U(x:) distinct :- V(x:), (x < 2 | x > 3);
