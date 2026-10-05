# The stock of a2.
# Expect: rows Q = [(40,)]
import lib.shop.Stock;
Q(qty:) :- Stock(sku: "a2", qty:);
