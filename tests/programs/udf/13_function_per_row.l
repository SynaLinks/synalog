# A function applied to each row of a predicate.
# Expect: rows S = [(1, 3), (2, 5), (3, 7)]
Next(x) = 2 * x + 1;
V(x:) :- x in [1, 2, 3];
@OrderBy(S, "x");
S(x:, y: Next(x)) :- V(x:);
