# Test: A range per row. (from tests/programs/arrays/23_range_of_a_column.l)

V(n:) :- n in [1, 2];
@OrderBy(A, "n", "i");
A(n:, i:) :- V(n:), i in Range(n);
