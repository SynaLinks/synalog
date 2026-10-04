# Iterating over an array held by a fact.
# Expect: rows X = [(1,), (3,)]
F(a: [3, 1]);
@OrderBy(X, "x");
X(x:) :- F(a:), x in a;
