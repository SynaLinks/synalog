# Test: The last of an ordered collection. (from tests/programs/arrays/27_array_ordered_then_element.l)

V(k: 3, v: "c");
V(k: 1, v: "a");
V(k: 2, v: "b");
L(l? Array= k -> v) distinct :- V(k:, v:);
A(last: Element(l, Size(l) - 1)) :- L(l:);
