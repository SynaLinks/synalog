# A page of ordered rows.
# Expect: page O 2 1 = [(20,), (30,)]
@OrderBy(O, "x");
O(x:) :- x in [40, 10, 30, 20];
