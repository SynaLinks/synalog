# A disjunction in a body.
# Expect: rows Small = [(1,), (5,)]
V(x:) :- x in [1, 3, 5];
@OrderBy(Small, "x");
Small(x:) :- V(x:), (x == 1 | x == 5);
