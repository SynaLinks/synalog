# A sum per group.
# Expect: rows Total = [("a", 3), ("b", 10)]
Sale(k: "a", v: 1);
Sale(k: "a", v: 2);
Sale(k: "b", v: 10);
@OrderBy(Total, "k");
Total(k:, v? += v) distinct :- Sale(k:, v:);
