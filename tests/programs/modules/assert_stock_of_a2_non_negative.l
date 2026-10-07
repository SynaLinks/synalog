# The stock of a2 is never negative.
# Expect: holds Stock.non_negative_a2
import lib.shop.Stock;
@Assert(Stock, non_negative_a2: """∀ q, Stock "a2" q → q ≥ 0 """);
