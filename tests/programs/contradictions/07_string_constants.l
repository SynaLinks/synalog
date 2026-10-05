# Text compared with two different strings.
# Expect: warning Contradictory conditions: s == "a", s == "b" can never all hold
# Expect: rows C = []
V(s:) :- s in ["a", "b"];
C(s:) :- V(s:), s == "a", s == "b";
