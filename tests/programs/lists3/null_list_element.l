# An element of a null list is null.
# Expect: rows Q = [(None,)]
V(l: null);
Q(e: Element(l, 0)) :- V(l:);
