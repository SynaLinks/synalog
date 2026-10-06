# A list of strings held by a fact, joined.
# Expect: rows Q = [("b/a/c",)]
F(l: ["b", "a", "c"]);
Q(s: Join(l, "/")) :- F(l:);
