# Test: The numbers below 4. (from tests/programs/lists2/range_4.l)

@OrderBy(Q, "x");
Q(x:) :- x in Range(4);
