# Test: @OrderBy with DESC. (from tests/programs/execution/11_order_desc.l)

V(s:) :- s in ["b", "a", "c"];
@OrderBy(Sorted, "s DESC");
Sorted(s:) :- V(s:);
