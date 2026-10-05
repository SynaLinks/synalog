# Test: Numbers between -5 and 5. (from tests/programs/numbers2/between.l)

N(x: -7);
N(x: -2);
N(x: 0);
N(x: 3);
N(x: 12);
N(x: 1099511627776);
@OrderBy(Q, "x");
Q(x:) :- N(x:), x >= -5, x <= 5;
