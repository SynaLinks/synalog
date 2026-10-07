# Joining a null list is null.
# Expect: rows Q = [(None,)]
V(l: null);
Q(s: Join(l, ",")) :- V(l:);
