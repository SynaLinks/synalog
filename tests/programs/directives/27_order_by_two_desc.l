# Ordering by two columns descending.
# Expect: rows O = [(2, 2), (2, 1), (1, 9)]
V(a: 1, b: 9);
V(a: 2, b: 1);
V(a: 2, b: 2);
@OrderBy(O, "a desc", "b desc");
O(a:, b:) :- V(a:, b:);
