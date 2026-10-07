# Test: A distinct predicate removes duplicate rows. (from tests/programs/execution/04_distinct_dedups.l)

R(x: 1);
R(x: 1);
R(x: 2);
@OrderBy(D, "x");
D(x:) distinct :- R(x:);
