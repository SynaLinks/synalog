# Concatenating null gives null.
# Expect: rows S = [(None,)]
V(x: null);
S(s:) :- V(x:), s == "a" ++ x;
