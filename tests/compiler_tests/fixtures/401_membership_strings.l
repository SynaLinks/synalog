# Test: Membership of strings. (from tests/programs/membership/04_strings.l)

V(s:) :- s in ["a", "b"];
M(s:) :- V(s:), s in ["b", "c"];
