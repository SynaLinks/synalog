# The stock of b2.
# Expect: rows Q = []
import lib.shop.Stock;
Q(qty:) :- Stock(sku: "b2", qty:);
