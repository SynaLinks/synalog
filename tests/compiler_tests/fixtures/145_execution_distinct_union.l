# Test: A distinct predicate defined by two rules removes duplicates across them. (from tests/programs/execution/62_distinct_union.l)

@OrderBy(U, "x");
U(x:) distinct :- x in [1, 2];
U(x:) distinct :- x in [2, 3];
