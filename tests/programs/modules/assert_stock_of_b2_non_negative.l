# The stock of b2 is never negative.
# Expect: holds Stock.non_negative_b2
import lib.shop.Stock;
@Assert(Stock, non_negative_b2: """∀ q, Stock "b2" q → q ≥ 0 """);
