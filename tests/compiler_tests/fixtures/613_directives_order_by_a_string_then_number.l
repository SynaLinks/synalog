# Test: Ordering by text, then a number descending. (from tests/programs/directives/32_order_by_a_string_then_number.l)

V(s: "b", n: 3);
V(s: "a", n: 1);
V(s: "a", n: 2);
@OrderBy(O, "s", "n desc");
O(s:, n:) :- V(s:, n:);
