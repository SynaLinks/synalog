# Test: A trailing space makes a different string. (from tests/programs/strings/37_trailing_space_matters.l)

V(s:) :- s in ["a", "a "];
D(s:) distinct :- V(s:);
S(n? += 1) distinct :- D(s:);
