# Test: A combine over no rows is null. (from tests/programs/combine4/over_nothing.l)

E(x: 1);
Q(s: (combine += x :- E(x:), x > 5), m: (combine Max= x :- E(x:), x > 5));
