# Pairs from one predicate.
# Expect: rows J = [(1, 2), (1, 3), (2, 3)]
V(x:) :- x in [1, 2, 3];
@OrderBy(J, "a", "b");
J(a:, b:) :- V(x: a), V(x: b), a < b;
