# An ordered list of text, joined.
# Expect: rows Q = [("B,a,b",)]
V(w: "b");
V(w: "a");
V(w: "B");
L(l? Array= w -> w) distinct :- V(w:);
Q(s: Join(l, ",")) :- L(l:);
