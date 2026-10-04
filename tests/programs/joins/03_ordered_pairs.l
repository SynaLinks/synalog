# Pairs with the first smaller than the second.
# Expect: rows P = [(1, 2), (1, 3), (2, 3)]
V(x:) :- x in [1, 2, 3];
@OrderBy(P, "a", "b");
P(a:, b:) :- V(x: a), V(x: b), a < b;
