# The empty text is not null.
# Expect: rows Q = [(1, 0)]
V(s: "");
Q(x: 1, n: Length(s)) :- V(s:), s is not null;
