# Test: Descending text with a null: the null last. (from tests/programs/ordering/13_order_by_text_desc_with_null.l)

V(s: "a");
V(s: null);
V(s: "b");
@OrderBy(O, "s desc");
O(s:) :- V(s:);
