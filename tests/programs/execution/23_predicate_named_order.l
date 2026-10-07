# A predicate named after a SQL keyword.
# Expect: rows Order = [(1,), (2,)]
@OrderBy(Order, "x");
Order(x:) :- x in [2, 1];
