# Test: Enumerating the parts of a split string. (from tests/programs/membership/06_in_a_split.l)

@OrderBy(M, "p");
M(p:) :- p in Split("c,a,b", ",");
