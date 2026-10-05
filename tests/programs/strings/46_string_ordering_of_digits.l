# Strings of digits order as text.
# Expect: rows S = [("1",), ("10",), ("2",)]
@OrderBy(S, "s");
S(s:) :- s in ["2", "10", "1"];
