# Test: Concatenating a null gives null. (from tests/programs/strings3/concat_null.l)

V(s: null);
Q(t: "a" ++ s) :- V(s:);
