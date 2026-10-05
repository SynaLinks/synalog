# A function whose value is a conditional.
# Expect: rows S = [(-2, -1), (0, 0), (5, 1)]
Sign(x) = (if x > 0 then 1 else if x < 0 then -1 else 0);
V(x:) :- x in [-2, 0, 5];
@OrderBy(S, "x");
S(x:, s: Sign(x)) :- V(x:);
