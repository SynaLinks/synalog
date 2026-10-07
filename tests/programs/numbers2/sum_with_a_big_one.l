# A sum past 32 bits.
# Expect: rows Q = [(1099511627782,)]
N(x: -7);
N(x: -2);
N(x: 0);
N(x: 3);
N(x: 12);
N(x: 1099511627776);
Q(s? += x) distinct :- N(x:);
