# An if-then-else expression.
# Expect: rows Sign = [(-2, "neg"), (0, "zero"), (3, "pos")]
V(x:) :- x in [3, -2, 0];
@OrderBy(Sign, "x");
Sign(x:, s:) :- V(x:), s == (if x < 0 then "neg" else if x == 0 then "zero" else "pos");
