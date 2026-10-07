# The stock of c1 is never negative.
# Expect: holds Stock.non_negative_c1
import lib.shop.Stock;
@Assert(Stock, non_negative_c1: """∀ q, Stock "c1" q → q ≥ 0 """);
