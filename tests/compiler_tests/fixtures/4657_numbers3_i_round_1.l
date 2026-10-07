# Test: Rounded to 1 digits, half away from zero. (from tests/programs/numbers3/i_round_1.l)

X(k: 1, x: 17);
X(k: 2, x: -17);
X(k: 3, x: 4);
X(k: 4, x: 0);
X(k: 5, x: null);
X(k: 6, x: 3000000000);
X(k: 7, x: -1);
X(k: 8, x: 9);
@OrderBy(Q, "k");
Q(k:, v: Round(x, 1)) :- X(k:, x:);
