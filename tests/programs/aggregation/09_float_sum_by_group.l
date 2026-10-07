# Float sums per group.
# Expect: rows S = [("a", 0.75), ("b", 0.5)]
R(k: "a", v: 0.25);
R(k: "a", v: 0.5);
R(k: "b", v: 0.5);
@OrderBy(S, "k");
S(k:, t? += v) distinct :- R(k:, v:);
