# Negation of a predicate named after a SQL keyword.
# Expect: rows Free = [(2,)]
Item(x:) :- x in [1, 2];
Order(x: 1);
Free(x:) :- Item(x:), ~Order(x:);
