# The alternatives as a predicate of their own, negated.
# Expect: rows Q = [(1,)]
V(x: 1);
V(x: 2);
V(x: 3);
Other(x:) distinct :- V(x:), x == 2 | V(x:), x == 3;
Q(x:) :- V(x:), ~Other(x:);
