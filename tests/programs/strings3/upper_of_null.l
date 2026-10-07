# Upper of a null is null.
# Expect: rows Q = [(None,)]
V(s: null);
Q(t: Upper(s)) :- V(s:);
