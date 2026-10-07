# The price of b2, from an imported predicate.
# Expect: rows Q = [(120,)]
import lib.shop.Product;
Q(price:) :- Product(sku: "b2", price:);
