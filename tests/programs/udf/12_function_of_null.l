# A function of a null value is null.
# Expect: rows S = [(1, -1), (2, 4)]
Square(x) = x * x;
V(k: 1, x: null);
V(k: 2, x: 2);
@OrderBy(S, "k");
S(k:, v: Coalesce(Square(x), -1)) :- V(k:, x:);
