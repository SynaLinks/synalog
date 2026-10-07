# distinct keeps rows differing in case.
# Expect: rows D = [("A",), ("a",)]
V(s:) :- s in ["a", "A", "a"];
@OrderBy(D, "s");
D(s:) distinct :- V(s:);
