# Item x has prices 1 and 2: (x, 1, 2) and (x, 2, 1).
# Expect: violated Price.key 2
# Expect: counterexamples Price.key = [("x", 1, 2), ("x", 2, 1)]

@Assert(Price, key: "∀ i p q, Price i p → Price i q → p = q");
Price(item: "x", price: 1);
Price(item: "x", price: 2);
Price(item: "y", price: 5);
