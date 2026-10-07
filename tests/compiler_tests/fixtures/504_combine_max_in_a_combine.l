# Test: The largest value, by a combine expression. (from tests/programs/combine/02_max_in_a_combine.l)

V(x:) :- x in [4, 9, 2];
T(m:) :- m == (combine Max= x :- V(x:));
