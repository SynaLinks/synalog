# Joining an ordered collection of strings.
# Expect: rows A = [("a-b-c",)]
V(k: 3, v: "c");
V(k: 1, v: "a");
V(k: 2, v: "b");
L(l? Array= k -> v) distinct :- V(k:, v:);
A(s: Join(l, "-")) :- L(l:);
