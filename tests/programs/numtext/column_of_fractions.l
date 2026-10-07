# A column of fractions as text, the same on every engine.
# Expect: rows Q = [(1, "0.1"), (2, "0.333333333333333"), (3, "2"), (4, "1000000")]
V(k: 1, x: 0.1);
V(k: 2, x: 1 / 3);
V(k: 3, x: 4 / 2);
V(k: 4, x: 1e6);
@OrderBy(Q, "k");
Q(k:, s: ToString(x)) :- V(k:, x:);
