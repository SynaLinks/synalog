# Conditions that can never all hold.
# Expect: warning Contradictory conditions
# Expect: warning s > "b"
# Expect: rows C = []
V(s:) :- s in ["a", "b"];
C(s:) :- V(s:), s == "a", s > "b";
