# A function with Coalesce for a default.
# Expect: rows S = [(1, 1), (2, 0)]
OrZero(x) = Coalesce(x, 0);
V(k: 1, x: 1);
V(k: 2, x: null);
@OrderBy(S, "k");
S(k:, v: OrZero(x)) :- V(k:, x:);
