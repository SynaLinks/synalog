# Test: Joining an ordered collection of strings. (from tests/programs/arrays/25_list_of_strings_joined_in_order.l)

V(k: 3, v: "c");
V(k: 1, v: "a");
V(k: 2, v: "b");
L(l? Array= k -> v) distinct :- V(k:, v:);
A(s: Join(l, "-")) :- L(l:);
