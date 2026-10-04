# Test: Float sums per group. (from tests/programs/aggregation/09_float_sum_by_group.l)

R(k: "a", v: 0.25);
R(k: "a", v: 0.5);
R(k: "b", v: 0.5);
@OrderBy(S, "k");
S(k:, t? += v) distinct :- R(k:, v:);
