# Numbers below each row's bound.
# Expect: rows A = [(2, 0), (2, 1)]
V(n: 2);
@OrderBy(A, "i");
A(n:, i:) :- V(n:), i in Range(n);
