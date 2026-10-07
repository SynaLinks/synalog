# A range per row.
# Expect: rows A = [(1, 0), (2, 0), (2, 1)]
V(n:) :- n in [1, 2];
@OrderBy(A, "n", "i");
A(n:, i:) :- V(n:), i in Range(n);
