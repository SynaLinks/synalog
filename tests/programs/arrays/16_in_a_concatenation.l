# Membership in a concatenation.
# Expect: rows A = [(1,), (2,), (3,)]
@OrderBy(A, "x");
A(x:) :- x in ArrayConcat([1, 2], [3]);
