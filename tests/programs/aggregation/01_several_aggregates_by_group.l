# Several aggregates per group.
# Expect: rows S = [("a", 2, 3, 1, 2), ("b", 1, 5, 5, 5)]
R(k: "a", v: 1);
R(k: "a", v: 2);
R(k: "b", v: 5);
@OrderBy(S, "k");
S(k:, n? += 1, t? += v, lo? Min= v, hi? Max= v) distinct :- R(k:, v:);
