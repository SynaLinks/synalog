# A search pattern carrying SQL is a pattern.
# Expect: search Q 'b$ = [("a'b",)]
@OrderBy(Q, "s");
Q(s:) :- s in ["a'b", "x\\'y", "plain", "); DROP"];
