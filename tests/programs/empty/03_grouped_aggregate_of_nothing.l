# A grouped aggregate over no rows has no rows.
# Expect: rows G = []
V(g:, x:) :- g in ["a"], x in [1], x > 5;
@OrderBy(G, "g");
G(g:, t? += x) distinct :- V(g:, x:);
