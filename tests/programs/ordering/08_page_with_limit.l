# A page within an @Limit.
# Expect: page O 5 1 = [(20,)]
@OrderBy(O, "x");
@Limit(O, 2);
O(x:) :- x in [40, 10, 30, 20];
