# Several comparisons in one body.
# Expect: rows Mid = [(3,), (4,)]
V(x:) :- x in [1, 2, 3, 4, 5];
@OrderBy(Mid, "x");
Mid(x:) :- V(x:), x > 2, x <= 4;
