# Membership in a list.
# Expect: valid
# Expect: rows Small = [(1,), (2,)]

Item(x:) :- x in [1, 2, 3];
@OrderBy(Small, "x");
Small(x:) :- Item(x:), x in [1, 2];
