# Conditions that can hold: no contradiction warning.
# Expect: quiet
# Expect: rows C = [('b',)]
V(s:) :- s in ["a", "b", "c"];
C(s:) :- V(s:), s > "a", s < "c";
