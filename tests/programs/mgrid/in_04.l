# Membership joins with the list's elements: a value listed twice matches
# twice, unless the predicate is distinct.
# Expect: rows M = [(1,), (1,)]
# Expect: rows D = [(1,)]
V(x:) :- x in [1];
@OrderBy(M, "x");
M(x:) :- V(x:), x in [1, 1];
D(x:) distinct :- V(x:), x in [1, 1];
