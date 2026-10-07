# Prices under 10: the others are counterexamples.
# Expect: counterexamples Price.under_10 = [('b1',), ('b2',)]
import lib.shop.Price;
@Assert(Price, under_10: "∀ s, Price s < 10");
