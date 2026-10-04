# Test: Filtering groups by their aggregate. (from tests/programs/aggregation/12_aggregate_then_filter.l)

R(k: "a", v: 10);
R(k: "a", v: 20);
R(k: "b", v: 5);
T(k:, t? += v) distinct :- R(k:, v:);
@OrderBy(Big, "k");
Big(k:) :- T(k:, t:), t > 10;
