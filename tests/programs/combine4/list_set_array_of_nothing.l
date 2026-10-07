# A list, a set and an ordered list of no rows are null.
# Expect: rows Q = [(None, None, None)]
E(x: 1);
Q(l: (combine List= x :- E(x:), x > 5), s: (combine Set= x :- E(x:), x > 5), a: (combine Array= x -> x :- E(x:), x > 5));
