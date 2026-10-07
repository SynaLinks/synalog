# Pairs x < y below 6.
# Expect: rows Q = [(15,)]
Q(c? += 1) distinct :- x in Range(6), y in Range(6), x < y;
