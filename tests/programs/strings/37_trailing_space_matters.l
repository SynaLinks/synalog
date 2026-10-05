# A trailing space makes a different string.
# Expect: rows S = [(2,)]
V(s:) :- s in ["a", "a "];
D(s:) distinct :- V(s:);
S(n? += 1) distinct :- D(s:);
