# The stock of c1.
# Expect: rows Q = [(0,)]
import lib.shop.Stock;
Q(qty:) :- Stock(sku: "c1", qty:);
