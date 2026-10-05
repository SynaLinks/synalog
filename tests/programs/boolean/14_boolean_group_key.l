# Grouping by a boolean.
# Expect: rows B = [(False, 2), (True, 1)]
V(x:) :- x in [1, 2, 5];
@OrderBy(B, "big");
B(big: x > 3, n? += 1) distinct :- V(x:);
