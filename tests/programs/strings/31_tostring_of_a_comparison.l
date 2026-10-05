# A comparison as text.
# Expect: rows S = [(1, "false"), (3, "true")]
V(x:) :- x in [1, 3];
@OrderBy(S, "x");
S(x:, t: ToString(x > 2)) :- V(x:);
