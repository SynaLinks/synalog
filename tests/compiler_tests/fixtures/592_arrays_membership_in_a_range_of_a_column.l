# Test: Numbers below each row's bound. (from tests/programs/arrays/28_membership_in_a_range_of_a_column.l)

V(n: 2);
@OrderBy(A, "i");
A(n:, i:) :- V(n:), i in Range(n);
