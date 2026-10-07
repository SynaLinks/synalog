# The price of b1 through another alias.
# Expect: rows Q = [(30,)]
import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "b1", price:);
