# Test: Number-like strings order as text. (from tests/programs/ordering/04_strings_order_by_text.l)

@OrderBy(O, "s");
O(s:) :- s in ["9", "10"];
