# The stock of a1 is never negative.
# Expect: holds Stock.non_negative_a1
import lib.shop.Stock;
@Assert(Stock, non_negative_a1: """∀ q, Stock "a1" q → q ≥ 0 """);
