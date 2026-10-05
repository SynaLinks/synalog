# The first element of an ordered collection.
# Expect: rows A = [("a",)]
V(k: 2, v: "b");
V(k: 1, v: "a");
L(l? Array= k -> v) distinct :- V(k:, v:);
A(first: Element(l, 0)) :- L(l:);
