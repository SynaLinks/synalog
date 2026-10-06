# A number with a point is a double: 0.1 + 0.2 is not 0.3.
# Expect: rows Q = []
Q(x: 1) :- 0.1 + 0.2 == 0.3;
