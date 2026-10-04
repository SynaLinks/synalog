# Test: Three branches, duplicates removed. (from tests/programs/unions/01_three_branches_distinct.l)

@OrderBy(U, "x");
U(x:) distinct :- x in [1, 2] | x in [2, 3] | x == 1;
