# Test: The size of a set of strings. (from tests/programs/arrays/18_set_of_strings_size.l)

V(s:) :- s in ["x", "y", "x"];
L(l? Set= s) distinct :- V(s:);
A(n: Size(l)) :- L(l:);
