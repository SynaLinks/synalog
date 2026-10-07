# Text sorts by character code.
# Expect: rows Q = [("1",), ("A",), ("B",), ("_",), ("a",), ("aB",), ("ab",), ("b",), ("é",)]
@OrderBy(Q, "s");
Q(s:) :- s in ["b", "B", "a", "A", "_", "1", "é", "ab", "aB"];
