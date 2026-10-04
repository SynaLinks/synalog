# A function in a filter.
# Expect: rows R = [(3,), (4,)]
Square(x) = x * x;
V(x:) :- x in [1, 2, 3, 4];
@OrderBy(R, "x");
R(x:) :- V(x:), Square(x) > 5;
