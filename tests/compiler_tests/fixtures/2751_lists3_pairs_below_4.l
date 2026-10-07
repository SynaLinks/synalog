# Test: Pairs x < y below 4. (from tests/programs/lists3/pairs_below_4.l)

Q(c? += 1) distinct :- x in Range(4), y in Range(4), x < y;
