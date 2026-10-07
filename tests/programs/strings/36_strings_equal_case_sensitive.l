# String equality distinguishes case.
# Expect: rows S = [("a",)]
V(s:) :- s in ["a", "A"];
S(s:) :- V(s:), s == "a";
