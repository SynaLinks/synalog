# Test: Text compared with two different strings. (from tests/programs/contradictions/07_string_constants.l)

V(s:) :- s in ["a", "b"];
C(s:) :- V(s:), s == "a", s == "b";
