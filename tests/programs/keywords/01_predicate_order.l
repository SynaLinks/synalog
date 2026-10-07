# Expect: rows Order = [(1,), (2,)]
@OrderBy(Order, "x");
Order(x:) :- x in [2, 1];
