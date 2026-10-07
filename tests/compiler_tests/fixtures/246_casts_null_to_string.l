# Test: Casting null stays null. (from tests/programs/casts/07_null_to_string.l)

V(x: null);
C(s:) :- V(x:), s == ToString(x);
