# A search over numbers as text.
# Expect: search O 5$ = [(15,), (25,)]
@OrderBy(O, "x");
O(x:) :- x in [15, 21, 25];
