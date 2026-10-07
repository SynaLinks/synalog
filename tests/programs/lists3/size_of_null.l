# The size of a null list is null.
# Expect: rows Q = [(None,)]
V(l: null);
Q(n: Size(l)) :- V(l:);
