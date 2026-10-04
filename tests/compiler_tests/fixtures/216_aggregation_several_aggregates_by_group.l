# Test: Several aggregates per group. (from tests/programs/aggregation/01_several_aggregates_by_group.l)

R(k: "a", v: 1);
R(k: "a", v: 2);
R(k: "b", v: 5);
@OrderBy(S, "k");
S(k:, n? += 1, t? += v, lo? Min= v, hi? Max= v) distinct :- R(k:, v:);
