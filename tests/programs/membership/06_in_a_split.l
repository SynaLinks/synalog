# Enumerating the parts of a split string.
# Expect: rows M = [("a",), ("b",), ("c",)]
@OrderBy(M, "p");
M(p:) :- p in Split("c,a,b", ",");
