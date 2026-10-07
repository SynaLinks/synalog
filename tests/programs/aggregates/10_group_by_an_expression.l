# Grouping by a computed key.
# Expect: rows A = [(0, 2), (1, 3)]
V(x:) :- x in [1, 2, 3, 4, 5];
@OrderBy(A, "k");
A(k: x % 2, n? += 1) distinct :- V(x:);
