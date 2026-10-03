# @OrderBy an aggregated column, descending.
# Expect: rows Total = [("b", 10), ("a", 3)]
Sale(k: "a", v: 1);
Sale(k: "a", v: 2);
Sale(k: "b", v: 10);
@OrderBy(Total, "v DESC");
Total(k:, v? += v) distinct :- Sale(k:, v:);
