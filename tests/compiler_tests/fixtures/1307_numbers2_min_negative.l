# Test: The minimum is negative. (from tests/programs/numbers2/min_negative.l)

N(x: -7);
N(x: -2);
N(x: 0);
N(x: 3);
N(x: 12);
N(x: 1099511627776);
Q(m? Min= x) distinct :- N(x:);
