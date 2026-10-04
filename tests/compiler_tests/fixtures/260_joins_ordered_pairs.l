# Test: Pairs with the first smaller than the second. (from tests/programs/joins/03_ordered_pairs.l)

V(x:) :- x in [1, 2, 3];
@OrderBy(P, "a", "b");
P(a:, b:) :- V(x: a), V(x: b), a < b;
