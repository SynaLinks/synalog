# Number-like strings order as text.
# Expect: rows O = [("10",), ("9",)]
@OrderBy(O, "s");
O(s:) :- s in ["9", "10"];
