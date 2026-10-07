# An empty list is not null.
# Expect: rows Q = [(1, False, 0)]
E(k: 1, l: []);
Q(k:, n: l is null, s: Size(l)) :- E(k:, l:);
