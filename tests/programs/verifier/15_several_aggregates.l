# Several aggregates in one head.
# Expect: valid
# Expect: rows Stats = [("a", 3, 2, 2, 1), ("b", 3, 2, 2, 1)]

Sale(c:, v:) :- c in ["a", "b"], v in [1, 2];
@OrderBy(Stats, "c");
Stats(c:, total? += v, n? += 1, top? Max= v, low? Min= v) distinct :- Sale(c:, v:);
