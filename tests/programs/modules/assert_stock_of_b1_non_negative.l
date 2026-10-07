# The stock of b1 is never negative.
# Expect: holds Stock.non_negative_b1
import lib.shop.Stock;
@Assert(Stock, non_negative_b1: """∀ q, Stock "b1" q → q ≥ 0 """);
