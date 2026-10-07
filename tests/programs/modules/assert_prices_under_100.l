# Prices under 100: the others are counterexamples.
# Expect: counterexamples Price.under_100 = [('b2',)]
import lib.shop.Price;
@Assert(Price, under_100: "∀ s, Price s < 100");
