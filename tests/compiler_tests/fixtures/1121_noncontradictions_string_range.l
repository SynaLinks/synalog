# Test: Conditions that can hold: no contradiction warning. (from tests/programs/noncontradictions/string_range.l)

V(s:) :- s in ["a", "b", "c"];
C(s:) :- V(s:), s > "a", s < "c";
