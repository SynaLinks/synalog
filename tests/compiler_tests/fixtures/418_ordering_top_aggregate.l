# Test: The largest group, by ordering and limiting. (from tests/programs/ordering/05_top_aggregate.l)

V(g:) :- g in ["a", "b", "b", "b", "c"];
@OrderBy(O, "n desc");
@Limit(O, 1);
O(g:, n? += 1) distinct :- V(g:);
