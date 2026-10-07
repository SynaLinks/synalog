# An empty list joined is an empty text.
# Expect: rows Q = [("",)]
E(l: []);
Q(v: Join(l, ",")) :- E(l:);
