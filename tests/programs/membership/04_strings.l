# Membership of strings.
# Expect: rows M = [("b",)]
V(s:) :- s in ["a", "b"];
M(s:) :- V(s:), s in ["b", "c"];
