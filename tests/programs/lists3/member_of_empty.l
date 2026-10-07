# Nothing is in an empty list.
# Expect: rows Q = []
V(x: 1);
Q(x:) :- V(x:), x in [];
