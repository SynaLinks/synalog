# The price of c1 through another alias.
# Expect: rows Q = [(8,)]
import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "c1", price:);
