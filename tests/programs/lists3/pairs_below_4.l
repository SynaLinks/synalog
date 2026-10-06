# Pairs x < y below 4.
# Expect: rows Q = [(6,)]
Q(c? += 1) distinct :- x in Range(4), y in Range(4), x < y;
