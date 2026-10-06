# Test: Pairs x < y below 3. (from tests/programs/lists3/pairs_below_3.l)

Q(c? += 1) distinct :- x in Range(3), y in Range(3), x < y;
