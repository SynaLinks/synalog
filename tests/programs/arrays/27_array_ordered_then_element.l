# The last of an ordered collection.
# Expect: rows A = [("c",)]
V(k: 3, v: "c");
V(k: 1, v: "a");
V(k: 2, v: "b");
L(l? Array= k -> v) distinct :- V(k:, v:);
A(last: Element(l, Size(l) - 1)) :- L(l:);
