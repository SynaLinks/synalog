# Test: A search pattern carrying SQL is a pattern. (from tests/programs/injection/search_00.l)

@OrderBy(Q, "s");
Q(s:) :- s in ["a'b", "x\\'y", "plain", "); DROP"];
