# Test: An if-then-else expression. (from tests/programs/execution/12_conditional.l)

V(x:) :- x in [3, -2, 0];
@OrderBy(Sign, "x");
Sign(x:, s:) :- V(x:), s == (if x < 0 then "neg" else if x == 0 then "zero" else "pos");
