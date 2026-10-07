# Test: An ordered list of text, joined. (from tests/programs/strings3/array_of_text_sorted.l)

V(w: "b");
V(w: "a");
V(w: "B");
L(l? Array= w -> w) distinct :- V(w:);
Q(s: Join(l, ",")) :- L(l:);
