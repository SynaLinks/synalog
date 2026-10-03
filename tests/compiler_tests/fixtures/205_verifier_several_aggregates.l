# Test: Several aggregates in one head. (from tests/programs/verifier/15_several_aggregates.l)

Sale(c:, v:) :- c in ["a", "b"], v in [1, 2];
@OrderBy(Stats, "c");
Stats(c:, total? += v, n? += 1, top? Max= v, low? Min= v) distinct :- Sale(c:, v:);
