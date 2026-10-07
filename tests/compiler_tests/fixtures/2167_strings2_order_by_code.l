# Test: Text sorts by character code. (from tests/programs/strings2/order_by_code.l)

@OrderBy(Q, "s");
Q(s:) :- s in ["b", "B", "a", "A", "_", "1", "é", "ab", "aB"];
