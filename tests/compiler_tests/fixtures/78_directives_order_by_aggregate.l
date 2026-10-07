# Test: @OrderBy an aggregated column, descending. (from tests/programs/directives/10_order_by_aggregate.l)

Sale(k: "a", v: 1);
Sale(k: "a", v: 2);
Sale(k: "b", v: 10);
@OrderBy(Total, "v DESC");
Total(k:, v? += v) distinct :- Sale(k:, v:);
