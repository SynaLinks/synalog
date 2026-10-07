# A search pattern carrying SQL is a pattern.
# Expect: search Q \\' = [("x\\\\'y",)]
@OrderBy(Q, "s");
Q(s:) :- s in ["a'b", "x\\'y", "plain", "); DROP"];
