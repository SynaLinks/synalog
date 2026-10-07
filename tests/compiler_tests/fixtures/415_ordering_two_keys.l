# Test: Ordering by two columns, opposite directions. (from tests/programs/ordering/02_two_keys.l)

V(g: "b", x: 5);
V(g: "a", x: 1);
V(g: "a", x: 2);
@OrderBy(O, "g", "x desc");
O(g:, x:) :- V(g:, x:);
