# A count over no rows made 0.
# Expect: rows Q = [(0,)]
E(x: 1);
Q(n: Coalesce((combine += 1 :- E(x:), x > 5), 0));
