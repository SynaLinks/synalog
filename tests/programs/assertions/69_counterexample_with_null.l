# A null value: the comparison is unknown, so no counterexample is claimed.
# Expect: holds Price.positive
@Assert(Price, positive: "∀ i, Price i > 0");
Price(item: "a", p: 3);
Price(item: "b", p: null);
