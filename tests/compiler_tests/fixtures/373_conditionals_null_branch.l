# Test: A conditional that is null in one branch. (from tests/programs/conditionals/02_null_branch.l)

V(x:) :- x in [1, 2];
@OrderBy(C, "x");
C(x:, w: (if x < 2 then "small" else null)) :- V(x:);
