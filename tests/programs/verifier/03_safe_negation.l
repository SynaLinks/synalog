# x is bound before it is negated.
# Expect: valid
# Expect: rows Allowed = [(1,), (3,)]

Item(x:) :- x in [1, 2, 3];
Banned(x: 2);
@OrderBy(Allowed, "x");
Allowed(x:) :- Item(x:), ~Banned(x:);
