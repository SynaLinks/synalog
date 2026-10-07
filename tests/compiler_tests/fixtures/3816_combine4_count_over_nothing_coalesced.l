# Test: A count over no rows made 0. (from tests/programs/combine4/count_over_nothing_coalesced.l)

E(x: 1);
Q(n: Coalesce((combine += 1 :- E(x:), x > 5), 0));
