# Negating a predicate with no rows keeps every row.
# Expect: rows N = [(1,), (2,)]
A(x:) :- x in [1, 2];
B(x:) :- x in [1], x > 5;
@OrderBy(N, "x");
N(x:) :- A(x:), ~B(x:);
