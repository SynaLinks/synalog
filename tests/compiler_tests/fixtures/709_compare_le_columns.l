# Test: Pairs of values with a <= b. (from tests/programs/compare/le_columns.l)

V(x:) :- x in [1, 2];
@OrderBy(C, "a", "b");
C(a:, b:) :- V(x: a), V(x: b), a <= b;
