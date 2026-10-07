# The price of a2 through another alias.
# Expect: rows Q = [(5,)]
import lib.shop.Product as Catalog;
Q(price:) :- Catalog(sku: "a2", price:);
