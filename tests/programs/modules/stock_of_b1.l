# The stock of b1.
# Expect: rows Q = [(3,)]
import lib.shop.Stock;
Q(qty:) :- Stock(sku: "b1", qty:);
