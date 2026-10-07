# A sum past 32 bits, from 64-bit values.
# Expect: rows N = [(6000000000,)]
V(x:) :- x in [1, 2, 3];
N(t? += ToInt64(x) * 1000000000) distinct :- V(x:);
