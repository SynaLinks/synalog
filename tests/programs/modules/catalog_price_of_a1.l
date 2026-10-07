# The price of a1 through another alias.
# Expect: rows Q = [(2,)]
import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "a1", price:);
