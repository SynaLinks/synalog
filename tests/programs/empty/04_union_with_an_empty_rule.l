# A rule with no rows adds nothing to a union.
# Expect: rows U = [(1,)]
U(x: 1);
U(x:) :- x in [2], x > 5;
