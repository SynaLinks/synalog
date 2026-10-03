# Test: An aggregate over a predicate with two rules, both contributing. (from tests/programs/execution/63_aggregate_over_union.l)

P(k: "a", v: 1);
P(k: "a", v: 2);
P(k: "a", v: 3);
Total(k:, t? += v) distinct :- P(k:, v:);
