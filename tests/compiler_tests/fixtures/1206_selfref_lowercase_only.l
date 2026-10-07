# Test: The strings equal to their own lowercase. (from tests/programs/selfref/lowercase_only.l)

@OrderBy(W, "s");
W(s:) :- s in ["a", "B", "c"], s == Lower(s);
