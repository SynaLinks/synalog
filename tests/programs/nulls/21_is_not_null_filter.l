# Keeping the rows with a value.
# Expect: rows N = [(1,), (3,)]
V(x: 1);
V(x: null);
V(x: 3);
@OrderBy(N, "x");
N(x:) :- V(x:), x is not null;
