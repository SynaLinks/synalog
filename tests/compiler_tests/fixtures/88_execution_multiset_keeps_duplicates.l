# Test: Without distinct, duplicate rows are kept. (from tests/programs/execution/05_multiset_keeps_duplicates.l)

R(x: 1);
R(x: 1);
R(x: 2);
@OrderBy(M, "x");
M(x:) :- R(x:);
