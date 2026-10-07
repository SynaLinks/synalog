# Test: The numbers below 0. (from tests/programs/lists2/range_0.l)

@OrderBy(Q, "x");
Q(x:) :- x in Range(0);
