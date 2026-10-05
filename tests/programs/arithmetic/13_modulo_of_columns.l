# Remainders of columns.
# Expect: rows A = [(10, 3, 1), (12, 5, 2)]
V(a: 10, b: 3);
V(a: 12, b: 5);
@OrderBy(A, "a");
A(a:, b:, r: a % b) :- V(a:, b:);
