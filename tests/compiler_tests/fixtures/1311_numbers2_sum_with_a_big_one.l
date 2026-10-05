# Test: A sum past 32 bits. (from tests/programs/numbers2/sum_with_a_big_one.l)

N(x: -7);
N(x: -2);
N(x: 0);
N(x: 3);
N(x: 12);
N(x: 1099511627776);
Q(s? += x) distinct :- N(x:);
