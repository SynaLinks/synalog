# Membership of null is not true.
# Expect: rows N = [(1,)]
V(x: 1);
V(x: null);
N(x:) :- V(x:), x in [1, 2];
