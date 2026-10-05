# The strings equal to their own lowercase.
# Expect: rows W = [("a",), ("c",)]
@OrderBy(W, "s");
W(s:) :- s in ["a", "B", "c"], s == Lower(s);
