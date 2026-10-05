# The truth table of !a.
# Expect: rows T = [(0, 0), (0, 1)]
V(x:) :- x in [0, 1];
@OrderBy(T, "x", "y");
T(x:, y:) :- V(x:), V(x: y), a == (x == 1), b == (y == 1), !a;
