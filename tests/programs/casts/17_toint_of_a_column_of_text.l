# Text columns as integers, summed.
# Expect: rows C = [(15,)]
V(s:) :- s in ["5", "10"];
C(t? += ToInt64(s)) distinct :- V(s:);
