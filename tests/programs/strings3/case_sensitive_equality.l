# Equality tells upper from lower case.
# Expect: rows Q = []
Q(x: 1) :- "a" == "A";
