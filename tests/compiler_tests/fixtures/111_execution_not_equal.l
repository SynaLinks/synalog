# Test: Inequality between two variables. (from tests/programs/execution/28_not_equal.l)

V(x:) :- x in [1, 2];
@OrderBy(Pair, "a", "b");
Pair(a:, b:) :- V(x: a), V(x: b), a != b;
