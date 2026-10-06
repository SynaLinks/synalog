# Concatenating a null gives null.
# Expect: rows Q = [(None,)]
V(s: null);
Q(t: "a" ++ s) :- V(s:);
