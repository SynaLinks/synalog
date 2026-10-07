# The largest group, by ordering and limiting.
# Expect: rows O = [("b", 3)]
V(g:) :- g in ["a", "b", "b", "b", "c"];
@OrderBy(O, "n desc");
@Limit(O, 1);
O(g:, n? += 1) distinct :- V(g:);
