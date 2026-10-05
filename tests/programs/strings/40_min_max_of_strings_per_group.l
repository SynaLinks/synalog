# The first and last strings of a group.
# Expect: rows S = [(1, "ant", "cat")]
V(g: 1, s: "cat");
V(g: 1, s: "ant");
V(g: 1, s: "bee");
S(g:, lo? Min= s, hi? Max= s) distinct :- V(g:, s:);
