# Test: A grouped aggregate over no rows has no rows. (from tests/programs/empty/03_grouped_aggregate_of_nothing.l)

V(g:, x:) :- g in ["a"], x in [1], x > 5;
@OrderBy(G, "g");
G(g:, t? += x) distinct :- V(g:, x:);
