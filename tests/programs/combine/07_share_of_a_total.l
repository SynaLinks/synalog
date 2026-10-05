# Each value's share of the total.
# Expect: rows T = [(1, 0.25), (3, 0.75)]
V(x:) :- x in [1, 3];
@OrderBy(T, "x");
T(x:, s: x / t) :- V(x:), t == (combine += y :- V(x: y));
