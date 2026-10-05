# Round to digits of a share computed from columns.
# Expect: rows Q = [("a", 33.33), ("b", 66.67)]
V(k: "a", x: 1);
V(k: "b", x: 2);
T(t? += x) distinct :- V(x:);
@OrderBy(Q, "k");
Q(k:, pct: Round(100 * x / t, 2)) :- V(k:, x:), T(t:);
