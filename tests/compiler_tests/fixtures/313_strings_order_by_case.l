# Test: Ordering strings: upper case sorts before lower case, byte by byte. (from tests/programs/strings/11_order_by_case.l)

@OrderBy(W, "w");
W(w:) :- w in ["b", "A", "a", "B"];
