# Test: Concatenating null gives null. (from tests/programs/strings/14_concat_null.l)

V(x: null);
S(s:) :- V(x:), s == "a" ++ x;
