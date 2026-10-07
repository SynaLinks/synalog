# A page of a predicate read from a table, in order.
# Expect: page O 2 1 = [("b", 2), ("c", 3)]
T(k: "d", v: 4);
T(k: "a", v: 1);
T(k: "c", v: 3);
T(k: "b", v: 2);
@OrderBy(O, "k");
O(k:, v:) :- T(k:, v:);
