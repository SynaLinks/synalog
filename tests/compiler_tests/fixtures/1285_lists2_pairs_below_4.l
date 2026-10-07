# Test: Pairs of distinct numbers below 4. (from tests/programs/lists2/pairs_below_4.l)

@OrderBy(Q, "a", "b");
Q(a:, b:) :- a in Range(4), b in Range(4), a < b;
