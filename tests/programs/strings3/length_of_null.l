# The length of a null is null.
# Expect: rows Q = [(None,)]
V(s: null);
Q(n: Length(s)) :- V(s:);
