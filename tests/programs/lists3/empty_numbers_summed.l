# Unnesting skips the empty list.
# Expect: rows Q = [(1, 7), (3, 5)]
F(k: 1, l: [3, 4]);
F(k: 2, l: []);
F(k: 3, l: [5]);
@OrderBy(Q, "k");
Q(k:, t? += x) distinct :- F(k:, l:), x in l;
