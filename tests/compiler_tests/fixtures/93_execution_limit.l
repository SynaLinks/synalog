# Test: @Limit keeps the first rows in order. (from tests/programs/execution/10_limit.l)

V(x:) :- x in [4, 1, 9, 7];
@OrderBy(Top, "x DESC");
@Limit(Top, 2);
Top(x:) :- V(x:);
