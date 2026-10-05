# Prices under 50: the others are counterexamples.
# Expect: counterexamples Price.under_50 = [('b2',)]
import lib.shop.Price;
@Assert(Price, under_50: "∀ s, Price s < 50");
