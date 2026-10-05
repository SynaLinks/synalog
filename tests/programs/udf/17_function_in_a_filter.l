# A function compared in a filter.
# Expect: rows S = [(3,), (4,)]
Square(x) = x * x;
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(S, "x");
S(x:) :- V(x:), Square(x) > 5;
