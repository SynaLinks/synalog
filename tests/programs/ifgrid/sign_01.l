# The sign of -3 in words.
# Expect: rows C = [("negative",)]
V(x: -3);
C(w: (if x < 0 then "negative" else if x == 0 then "zero" else "positive")) :- V(x:);
