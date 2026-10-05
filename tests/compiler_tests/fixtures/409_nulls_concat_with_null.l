# Test: Concatenating a null gives null. (from tests/programs/nulls/10_concat_with_null.l)

V(s: null);
N(v: "a" ++ s) :- V(s:);
