# A combine over no rows is null.
# Expect: rows Q = [(None, None)]
E(x: 1);
Q(s: (combine += x :- E(x:), x > 5), m: (combine Max= x :- E(x:), x > 5));
