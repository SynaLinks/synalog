# A search pattern carrying SQL is a pattern.
# Expect: search Q [)]; DROP = [('); DROP',)]
@OrderBy(Q, "s");
Q(s:) :- s in ["a'b", "x\\'y", "plain", "); DROP"];
