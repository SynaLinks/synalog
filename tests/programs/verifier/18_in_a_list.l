# Membership in a list.
# Expect: valid

Item(x:) :- x in [1, 2, 3];
Small(x:) :- Item(x:), x in [1, 2];
