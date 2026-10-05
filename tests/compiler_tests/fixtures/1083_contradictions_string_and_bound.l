# Test: Conditions that can never all hold. (from tests/programs/contradictions/string_and_bound.l)

V(s:) :- s in ["a", "b"];
C(s:) :- V(s:), s == "a", s > "b";
