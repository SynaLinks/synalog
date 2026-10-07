# The price of b1, from an imported predicate.
# Expect: rows Q = [(30,)]
import lib.shop.Product;
Q(price:) :- Product(sku: "b1", price:);
