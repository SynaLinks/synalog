# Pairs x < y below 3.
# Expect: rows Q = [(3,)]
Q(c? += 1) distinct :- x in Range(3), y in Range(3), x < y;
