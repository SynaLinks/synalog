# A search pattern carrying SQL is a pattern.
# Expect: search Q [']; DROP TABLE t; --|plain = [('plain',)]
@OrderBy(Q, "s");
Q(s:) :- s in ["a'b", "x\\'y", "plain", "); DROP"];
