# A condition on a null is not true: the else branch.
# Expect: rows C = [("no",)]
V(x: null);
C(w: (if x > 0 then "yes" else "no")) :- V(x:);
