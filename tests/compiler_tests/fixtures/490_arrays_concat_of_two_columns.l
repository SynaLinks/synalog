# Test: Concatenating two list columns. (from tests/programs/arrays/24_concat_of_two_columns.l)

V(a: [1, 2], b: [3]);
A(n: Size(ArrayConcat(a, b))) :- V(a:, b:);
