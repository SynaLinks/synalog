# The price of b2 through another alias.
# Expect: rows Q = [(120,)]
import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "b2", price:);
