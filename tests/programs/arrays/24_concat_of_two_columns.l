# Concatenating two list columns.
# Expect: rows A = [(3,)]
V(a: [1, 2], b: [3]);
A(n: Size(ArrayConcat(a, b))) :- V(a:, b:);
