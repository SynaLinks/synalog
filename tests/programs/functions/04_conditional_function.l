# A function with a conditional.
# Expect: rows R = [(-1, -5), (1, 5)]
SignOf(x) = (if x < 0 then -1 else 1);
V(x:) :- x in [5, -5];
@OrderBy(R, "x");
R(s:, x:) :- V(x:), s == SignOf(x);
