# Test: The first element of an ordered collection. (from tests/programs/arrays/20_element_of_a_list_aggregate.l)

V(k: 2, v: "b");
V(k: 1, v: "a");
L(l? Array= k -> v) distinct :- V(k:, v:);
A(first: Element(l, 0)) :- L(l:);
