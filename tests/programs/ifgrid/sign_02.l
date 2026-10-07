# The sign of 0 in words.
# Expect: rows C = [("zero",)]
V(x: 0);
C(w: (if x < 0 then "negative" else if x == 0 then "zero" else "positive")) :- V(x:);
