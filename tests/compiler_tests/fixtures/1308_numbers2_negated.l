# Test: Negation of each number. (from tests/programs/numbers2/negated.l)

N(x: -7);
N(x: -2);
N(x: 0);
N(x: 3);
N(x: 12);
N(x: 1099511627776);
@OrderBy(Q, "x", "n");
Q(x:, n: -x) :- N(x:);
