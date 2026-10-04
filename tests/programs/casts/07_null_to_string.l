# Casting null stays null.
# Expect: rows C = [(None,)]
V(x: null);
C(s:) :- V(x:), s == ToString(x);
