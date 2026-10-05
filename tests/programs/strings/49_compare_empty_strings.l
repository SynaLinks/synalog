# The empty string sorts first.
# Expect: rows S = [("",), ("a",)]
@OrderBy(S, "s");
S(s:) :- s in ["a", ""];
