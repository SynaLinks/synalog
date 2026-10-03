# An aggregate over a predicate with two rules, both contributing.
# Expect: rows Total = [("a", 6)]
P(k: "a", v: 1);
P(k: "a", v: 2);
P(k: "a", v: 3);
Total(k:, t? += v) distinct :- P(k:, v:);
