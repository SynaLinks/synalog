# Concatenating a null gives null.
# Expect: rows N = [(None,)]
V(s: null);
N(v: "a" ++ s) :- V(s:);
