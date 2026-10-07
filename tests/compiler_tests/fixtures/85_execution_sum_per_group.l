# Test: A sum per group. (from tests/programs/execution/02_sum_per_group.l)

Sale(k: "a", v: 1);
Sale(k: "a", v: 2);
Sale(k: "b", v: 10);
@OrderBy(Total, "k");
Total(k:, v? += v) distinct :- Sale(k:, v:);
