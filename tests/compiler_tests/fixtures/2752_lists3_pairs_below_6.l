# Test: Pairs x < y below 6. (from tests/programs/lists3/pairs_below_6.l)

Q(c? += 1) distinct :- x in Range(6), y in Range(6), x < y;
