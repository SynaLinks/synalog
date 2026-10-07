# Test: Ordering by two columns descending. (from tests/programs/directives/27_order_by_two_desc.l)

V(a: 1, b: 9);
V(a: 2, b: 1);
V(a: 2, b: 2);
@OrderBy(O, "a desc", "b desc");
O(a:, b:) :- V(a:, b:);
