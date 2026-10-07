# Test: The sum per sign. (from tests/programs/numbers3/d_sum_by_sign.l)

X(k: 1, x: 7);
X(k: 2, x: -7);
X(k: 3, x: 2.5);
X(k: 4, x: -2.5);
X(k: 5, x: 0);
X(k: 6, x: null);
X(k: 7, x: 0.1);
X(k: 8, x: -0.75);
@OrderBy(Q, "s");
Q(s: (if x > 0 then 1 else if x < 0 then -1 else 0), t? += x) distinct :- X(x:);
