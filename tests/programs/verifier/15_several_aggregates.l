# Several aggregates in one head.
# Expect: valid

Sale(c:, v:) :- c in ["a", "b"], v in [1, 2];
Stats(c:, total? += v, n? += 1, top? Max= v, low? Min= v) distinct :- Sale(c:, v:);
