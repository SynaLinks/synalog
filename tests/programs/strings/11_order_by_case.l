# Ordering strings: upper case sorts before lower case, byte by byte.
# Expect: rows W = [("A",), ("B",), ("a",), ("b",)]
@OrderBy(W, "w");
W(w:) :- w in ["b", "A", "a", "B"];
