# The stock of a1.
# Expect: rows Q = [(100,)]
import lib.shop.Stock;
Q(qty:) :- Stock(sku: "a1", qty:);
